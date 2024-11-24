package cn.svcci.file.service.impl;

import cn.svcci.file.damain.dto.FileTextResponseDto;
import cn.svcci.file.damain.dto.FileUploadRequestDto;
import cn.svcci.file.result.Result;
import cn.svcci.file.service.FileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Slf4j
public class FileServiceImpl implements FileService {

    // 定义合法的文件后缀名常量
    private static final List<String> VALID_FILE_EXTENSIONS = Arrays.asList("txt", "md", "doc", "docx", "pdf");

    // 注入文件上传的最大大小属性，单位为字节，若handler.upload.max-size未配置，则默认为100MB
    @Value("${file.upload.max-size:104857600}")
    private long maxFileSize;


    // 阿里云OSS上传文件
    @Override
    public Result<String> uploadFileOss(FileUploadRequestDto file) {

        return Result.success("上传成功");
    }

    @Override
    public Result<String> uploadFileLocal(FileUploadRequestDto file) {
        return Result.success("上传成功");
    }

    // 下载文件
    @Override
    public Result<FileTextResponseDto> getFileById(String fileId) {
        return Result.success();
    }

    // 获取所有文件
    @Override
    public Result<List<FileTextResponseDto>> getAllFiles() {

        return Result.success();
    }

    // 删除文件
    @Override
    public Result<String> deleteFile(String fileId) {
        return null;
    }


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
//        return Result.success("上传成功");
//    }
//



    // 验证文件
    private Result<String> validateFile(MultipartFile file) {
        // 判断文件是否为空
        if (file.isEmpty()) {
            log.error("文件为空");
            return Result.error("文件为空");
        }

        // 判断文件类型和大小
        if (!isValidFileType(file) || file.getSize() > maxFileSize) {
            log.error("文件类型不正确或文件大小超过限制");
            return Result.error("文件类型不正确或文件大小超过限制");
        }

        return Result.success("文件验证通过");
    }


    // 判断文件类型是否合法
    private boolean isValidFileType(MultipartFile file) {
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();

        // 定义合法的文件后缀名
        //hashset效率高于arraylist
        Set<String> validExtensions = new HashSet<>(VALID_FILE_EXTENSIONS);
        String fileExtension = getFileExtension(fileName);

        // 检查后缀和 MIME 类型
        return validExtensions.contains(fileExtension) && isValidMimeType(contentType);
    }

    // 判断 MIME 类型是否合法
    private boolean isValidMimeType(String contentType) {
        return "application/pdf".equals(contentType) ||
                "application/msword".equals(contentType) ||
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document".equals(contentType) ||
                "text/plain".equals(contentType) ||
                "text/markdown".equals(contentType) ||
                "text/x-markdown".equals(contentType);
    }

    // 获取文件后缀名
    private String getFileExtension(String fileName) {
        int lastIndex = fileName.lastIndexOf('.');
        return (lastIndex > 0 && lastIndex < fileName.length() - 1) ? fileName.substring(lastIndex + 1).toLowerCase() : "";
    }

}
