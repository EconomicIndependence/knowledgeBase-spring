package cn.svcci.file.service.impl;

import cn.svcci.api.client.UserServiceFeignClient;
import cn.svcci.api.dto.UserDto;
import cn.svcci.common.response.Result;
import cn.svcci.file.config.OssConfig;
import cn.svcci.file.damain.dto.FileUploadRequestDto;
import cn.svcci.file.damain.entity.FileInfoDo;
import cn.svcci.file.service.FileInfoService;
import cn.svcci.file.service.FileUploadService;
import cn.svcci.file.validator.FileValidator;
import com.aliyun.oss.OSS;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;

@Service
@Slf4j
public class FileUploadServiceImpl implements FileUploadService {



    private final UserServiceFeignClient userServiceFeignClient;
    private final OSS ossClient;  // 注入 OSSClient
    private final FileValidator fileValidator;  // 注入文件验证器
    private final OssConfig ossConfig;  // 注入配置类，获取 bucketName 配置
    private final FileInfoService fileInfoService;  // 注入文件信息服务

    @Autowired
    public FileUploadServiceImpl(UserServiceFeignClient userServiceFeignClient, OSS ossClient, FileValidator fileValidator, OssConfig ossConfig, FileInfoService fileInfoService) {
        this.userServiceFeignClient = userServiceFeignClient;
        this.ossClient = ossClient;
        this.fileValidator = fileValidator;
        this.ossConfig = ossConfig;
        this.fileInfoService = fileInfoService;
    }

    @Override
    public Result<String> uploadFileOss(FileUploadRequestDto fileDto) {

        MultipartFile file = fileDto.getFile();
        if (fileValidator.isInvalidFile(file)) {
            return Result.error("文件格式不支持");
        }

        try (InputStream inputStream = file.getInputStream()) {
            // 调用 Feign Client 查询用户信息
            log.info("查询用户信息");
            Result<UserDto> resultUserDto = userServiceFeignClient.queryUserProfile(fileDto.getUserId());

            if (!Result.isSuccess(resultUserDto)) {
                log.error("查询用户信息失败：{}", resultUserDto.getMsg());
                return Result.error("查询用户信息失败");
            }
            String username = resultUserDto.getData().getUsername();
            // 设置文件存储路径
            String fileName = file.getOriginalFilename();
            String filePath = "uploads/"+ username + "/" + fileName;  // 存储路径

            // 创建上传请求
            PutObjectRequest putObjectRequest = new PutObjectRequest(ossConfig.getBucketName(), filePath, inputStream);

            // 可选：设置文件的元数据
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(file.getContentType());
            putObjectRequest.setMetadata(metadata);

            // 上传文件
            ossClient.putObject(putObjectRequest);

            // 获取文件的 URL（OSS 的 URL 结构）
            String ossUrl = "https://" + ossConfig.getBucketName() + "." + ossConfig.getEndpoint() + "/" + filePath;
            // 关闭 OSSClient
//            ossClient.shutdown();
            log.info("文件上传成功，URL: {}", ossUrl);
//          TODO: 有bug文件上传到了阿里云成功，但文件内容是不合法的，错误已经抛出
            // 文件上传成功后，保存文件元数据


            FileInfoDo fileInfo = new FileInfoDo();
            fileInfo.setUserName(username);
            fileInfo.setFileName(file.getOriginalFilename());// 文件名
            fileInfo.setFileSize(file.getSize());// 文件大小
            fileInfo.setFileType(file.getContentType());// 文件类型
            fileInfo.setUploadTime(LocalDateTime.now());// 上传时间
            fileInfo.setFilePath(filePath);// 文件 目录
            fileInfo.setOssUrl(ossUrl);// 文件 URL
            fileInfoService.save(fileInfo);

            // 返回文件的 URL
            return Result.success(ossUrl);

        } catch (IOException e) {
            log.error("上传文件时发生错误：", e);
            return Result.error("上传失败");
        } catch (Exception e) {
            log.error("上传到阿里云OSS时发生错误：", e);
            return Result.error("上传失败");
        }
    }

    @Override
    public Result<String> uploadFileLocal(FileUploadRequestDto fileDto) {

        MultipartFile file = fileDto.getFile();
        if (fileValidator.isInvalidFile(file)) {
            return Result.error("文件格式不支持");
        }

        try (InputStream inputStream = file.getInputStream()) {

        // 本地上传文件
//    public Result<String> uploadFile(String user, MultipartFile file) {
//        // 判断文件是否合法
//        Result<String> validationResult = validateFile(file);
//        if (!validationResult.isSuccess()) {
//            return validationResult;
//        }
//
//        // 保存文件
//        String fileName = file.getOriginalFilename();
//        String filePath = "./upload/" + user + "/" + fileName;
//        try {
//            // 创建上传目录
//            file.transferTo(new File(filePath));
//        } catch (Exception e) {
//            log.error("上传文件失败", e);
//            return Result.error("上传文件失败");
//        }
//
//        log.info("用户{}上传文件成功: 文件名：{}，文件路径：{}", user, fileName, filePath);

        return Result.success("上传成功");
    } catch (IOException e) {
        log.error("上传文件时发生错误：", e);
        return Result.error("上传失败");
    } catch (Exception e) {
        log.error("上传到阿里云OSS时发生错误：", e);
        return Result.error("上传失败");
    }

    }
}
