package cn.svcci.search;

import cn.svcci.search.config.ElasticSearchConfig;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.indices.CreateIndexResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;


import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@Slf4j
@SpringBootTest(classes = SearchApplication.class) // 启动 Spring Boot 应用
@Import(ElasticSearchConfig.class) // 确保你的配置类被加载
public class ElasticsearchClientTest {

    @Resource(name = "accountAndCertificateConnectionESClient")
    private ElasticsearchClient accountAndCertificateConnectionESClient;

    @Value("${elasticsearch.open}")
    private String open;  // 从配置文件获取 "open" 参数

    @Test
    public void accountAndCertificateConnectionTest() throws IOException {
        // 断言 ElasticsearchClient 不为 null
        assertNotNull(accountAndCertificateConnectionESClient, "ElasticsearchClient 应该已注入");

        // 检查 ES 是否开启
        if ("true".equals(open)) {
            // 创建索引
            CreateIndexResponse response = accountAndCertificateConnectionESClient.indices()
                    .create(c -> c.index("account_and_certificate_connection_index"));
            // 打印响应信息
            log.info(response.toString());
            System.out.println(response.toString());
        } else {
            log.info("Elasticsearch 服务已关闭");
        }
    }
}
