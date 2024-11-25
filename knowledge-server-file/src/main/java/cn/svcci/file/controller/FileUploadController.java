package cn.svcci.file.controller;

import cn.svcci.file.damain.dto.FileUploadRequestDto;
import cn.svcci.file.result.Result;
import cn.svcci.file.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 文件上传控制器
 */
@RestController
@RequestMapping("/api/files/upload")
public class FileUploadController {


    private final FileUploadService fileUploadService;

    @Autowired
    public FileUploadController(FileUploadService fileUploadService) {
        this.fileUploadService = fileUploadService;
    }

    /**
     * 上传文件到阿里云OSS
     * @param file 文件上传请求
     * @return 操作结果
     */
    @PostMapping("/oss")
    public Result<String> uploadFileOss(@RequestBody FileUploadRequestDto file) {
        return fileUploadService.uploadFileOss(file);
    }

    /**
     * 上传文件到本地存储
     * @param file 文件上传请求
     * @return 操作结果
     */
    @PostMapping("/local")
    public Result<String> uploadFileLocal(@RequestBody FileUploadRequestDto file) {
        return fileUploadService.uploadFileLocal(file);
    }
}