package cn.svcci.file.validator;

import cn.svcci.file.config.FileUploadConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import cn.svcci.file.config.FileUploadConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Component
public class FileValidator {

    private final FileUploadConfig fileuploadConfig;

    @Autowired
    public FileValidator(FileUploadConfig fileuploadConfig) {
        this.fileuploadConfig = fileuploadConfig;
    }

    /**
     * 校验文件是否合法
     * @param file 上传的文件
     * @return 如果文件合法返回 false，否则返回 true
     */
    public boolean isInvalidFile(MultipartFile file) {
        log.info("开始校验文件：{}", file.getOriginalFilename());  // 记录上传的文件名

        // 校验文件是否符合所有标准
        boolean isValidFile = isValidFileSize(file) && isValidFileType(file) && isValidMimeType(file);

        if (!isValidFile) {
            log.warn("文件 {} 校验失败，可能的原因：文件大小、类型或 MIME 类型不合法", file.getOriginalFilename());
        } else {
            log.info("文件 {} 校验通过", file.getOriginalFilename());
        }

        // 返回文件是否无效：如果文件无效返回 true，文件有效返回 false
        return !isValidFile;  // 如果文件不合法返回 true，合法返回 false
    }

    /**
     * 校验文件类型是否合法
     * @param file 上传的文件
     * @return 如果文件类型合法返回 true，否则返回 false
     */
    private boolean isValidFileType(MultipartFile file) {
        String extension = getFileExtension(file.getOriginalFilename());  // 获取文件后缀名
        boolean isValidType = fileuploadConfig.getAllowedTypes().contains(extension);  // 校验后缀名是否在允许列表中

        log.debug("文件 {} 后缀名：{}，是否在允许类型中：{}", file.getOriginalFilename(), extension, isValidType);

        return isValidType;
    }

    /**
     * 校验文件大小是否合法
     * @param file 上传的文件
     * @return 如果文件大小合法返回 true，否则返回 false
     */
    private boolean isValidFileSize(MultipartFile file) {
        boolean isValidSize = file.getSize() <= fileuploadConfig.getMaxSize();  // 校验文件大小是否小于最大值

        log.debug("文件 {} 大小：{}，是否小于最大允许大小：{}", file.getOriginalFilename(), file.getSize(), isValidSize);

        return isValidSize;
    }

    /**
     * 校验文件的 MIME 类型是否合法
     * @param file 上传的文件
     * @return 如果 MIME 类型合法返回 true，否则返回 false
     */
    private boolean isValidMimeType(MultipartFile file) {
        String mimeType = file.getContentType();  // 获取文件的 MIME 类型
        boolean isValidMime = fileuploadConfig.getAllowedMimeTypes().contains(mimeType);  // 校验 MIME 类型是否在允许列表中

        log.debug("文件 {} MIME 类型：{}，是否在允许 MIME 类型中：{}", file.getOriginalFilename(), mimeType, isValidMime);

        return isValidMime;
    }

    /**
     * 获取文件的后缀名
     * @param fileName 文件名
     * @return 文件后缀名（小写），如果没有后缀名返回空字符串
     */
    private String getFileExtension(String fileName) {
        int index = fileName.lastIndexOf('.');  // 查找最后一个 '.' 的位置
        return index > 0 ? fileName.substring(index + 1).toLowerCase() : "";  // 提取并返回后缀名
    }
}
