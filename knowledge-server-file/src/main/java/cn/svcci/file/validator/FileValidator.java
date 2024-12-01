package cn.svcci.file.validator;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.util.Set;

@Component
public class FileValidator {

    @Value("${file.upload.maxSize}")
    private long maxFileSize;

    @Value("${file.upload.allowedTypes}")
    private Set<String> allowedFileTypes;

    @Value("${file.upload.allowedMimeTypes}")
    private Set<String> allowedMimeTypes;

    // 校验文件是否合法
    public boolean isValidFile(MultipartFile file) {
        return isValidFileSize(file) && isValidFileType(file) && isValidMimeType(file);
    }

    // 校验文件类型
    private boolean isValidFileType(MultipartFile file) {
        String extension = getFileExtension(file.getOriginalFilename());// 获取文件后缀名
        return allowedFileTypes.contains(extension);
    }

    // 校验文件大小
    private boolean isValidFileSize(MultipartFile file) {
        return file.getSize() <= maxFileSize;
    }

    // 校验文件的 MIME 类型
    private boolean isValidMimeType(MultipartFile file) {
        String mimeType = file.getContentType();
        return allowedMimeTypes.contains(mimeType);
    }

    // 获取文件后缀名
    private String getFileExtension(String fileName) {
        int index = fileName.lastIndexOf('.');
        return index > 0 ? fileName.substring(index + 1).toLowerCase() : "";
    }
}
