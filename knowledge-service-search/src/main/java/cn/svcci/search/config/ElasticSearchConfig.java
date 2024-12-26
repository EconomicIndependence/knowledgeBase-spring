package cn.svcci.search.config;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.ssl.SSLContexts;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import javax.net.ssl.SSLContext;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.util.Objects;

@Slf4j
@Data
@Configuration
@ConfigurationProperties(prefix = "elasticsearch") // 从配置文件读取以"elasticsearch"为前缀的配置
public class ElasticSearchConfig {

    // 是否开启ES
    private Boolean open;

    // es 集群主机地址（包括IP和端口）
    private String hosts;

    // es 用户名
    private String userName;

    // es 密码
    private String password;

    // es 请求方式，如 http 或 https
    private String scheme;

    // es 集群名称
    private String clusterName;

    // es 连接超时时间（毫秒）
    private int connectTimeOut;

    // es socket 连接超时时间（毫秒）
    private int socketTimeOut;

    // es 请求超时时间（毫秒）
    private int connectionRequestTimeOut;

    // es 最大连接数
    private int maxConnectNum;

    // es 每个路由的最大连接数
    private int maxConnectNumPerRoute;

    // es API 密钥
    private String apiKey;

    // 创建 RestClientBuilder 并设置基本的连接配置
    public RestClientBuilder creatBaseConfBuilder(String scheme){

        // 1. 从配置的 hosts 中提取主机地址和端口
        String host = hosts.split(":")[0];
        String port = hosts.split(":")[1];
        // 设置连接协议为 http 或 https
        HttpHost httpHost = new HttpHost(host, Integer.parseInt(port), scheme);

        // 2. 创建 RestClientBuilder 对象
        RestClientBuilder builder = RestClient.builder(httpHost);

        // 设置连接的超时配置
        builder.setRequestConfigCallback(requestConfigBuilder -> {
            requestConfigBuilder.setConnectTimeout(connectTimeOut);  // 设置连接超时时间
            requestConfigBuilder.setSocketTimeout(socketTimeOut);    // 设置 socket 超时时间
            requestConfigBuilder.setConnectionRequestTimeout(connectionRequestTimeOut); // 设置请求超时时间
            return requestConfigBuilder;
        });

        // 3. 设置 HttpClient 连接池配置
        builder.setHttpClientConfigCallback(httpClientBuilder -> {
            httpClientBuilder.setMaxConnTotal(maxConnectNum); // 设置最大连接数
            httpClientBuilder.setMaxConnPerRoute(maxConnectNumPerRoute); // 设置每个路由的最大连接数
            return httpClientBuilder;
        });

        return builder;
    }

    /**
     * 创建一个带有账户和证书认证的 Elasticsearch 客户端
     * @return ElasticsearchClient 客户端对象
     */
    @Bean(name = "accountAndCertificateConnectionESClient") // 定义该方法为 Spring 的 Bean
    public ElasticsearchClient accountAndCertificateConnectionESClient() {

        // 创建基础的 RestClientBuilder 配置，传入连接协议（http 或 https）
        RestClientBuilder builder = creatBaseConfBuilder((Objects.equals(scheme, "https")) ? "https" : "http");

        // 1. 设置账号和密码进行认证
        CredentialsProvider credentialsProvider = new BasicCredentialsProvider(); // 创建凭证提供者
        credentialsProvider.setCredentials(AuthScope.ANY, new UsernamePasswordCredentials(userName, password)); // 设置用户名和密码

        // 2. 配置 SSL 证书和账号密码认证
        builder.setHttpClientConfigCallback(httpAsyncClientBuilder -> httpAsyncClientBuilder
                .setSSLContext(buildSSLContext())  // 设置 SSL 上下文
                .setSSLHostnameVerifier(NoopHostnameVerifier.INSTANCE)  // 设置主机名验证器为 NoopHostnameVerifier，表示不验证主机名
                .setDefaultCredentialsProvider(credentialsProvider));  // 设置默认凭证提供者

        // 使用 RestClientTransport 将 RestClient 与 JSON 映射器进行连接
        RestClientTransport transport = new RestClientTransport(builder.build(), new JacksonJsonpMapper());

        // 创建 Elasticsearch 客户端并返回
        ElasticsearchClient esClient = new ElasticsearchClient(transport);
        return esClient;
    }

    // 创建 SSL 上下文，读取证书文件并配置 SSL
    private static SSLContext buildSSLContext() {

        // 从类路径中读取证书文件
        ClassPathResource resource = new ClassPathResource("http_ca.crt");
        SSLContext sslContext = null;
        try {
            // 使用 X.509 格式创建证书工厂
            CertificateFactory factory = CertificateFactory.getInstance("X.509");
            Certificate trustedCa;
            try (InputStream is = resource.getInputStream()) {
                trustedCa = factory.generateCertificate(is); // 生成证书
            }

            // 创建一个空的密钥库
            KeyStore trustStore = KeyStore.getInstance("pkcs12");
            trustStore.load(null, "liuxiansheng".toCharArray()); // 设置密钥库密码
            trustStore.setCertificateEntry("ca", trustedCa); // 将证书添加到密钥库中

            // 使用证书密钥库来创建 SSLContext
            SSLContextBuilder sslContextBuilder = SSLContexts.custom()
                    .loadTrustMaterial(trustStore, null); // 加载信任材料（证书）
            sslContext = sslContextBuilder.build(); // 构建 SSLContext

        } catch (CertificateException | IOException | KeyStoreException | NoSuchAlgorithmException |
                 KeyManagementException e) {
            log.error("ES连接认证失败", e); // 出现异常时打印错误日志
        }

        return sslContext; // 返回创建好的 SSLContext
    }
}
