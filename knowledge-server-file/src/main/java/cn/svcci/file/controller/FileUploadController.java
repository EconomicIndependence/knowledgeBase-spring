package cn.svcci.file.controller;

import cn.svcci.common.response.Result;
import cn.svcci.common.utils.UserContext;
import cn.svcci.file.damain.dto.FileUploadRequestDto;

import cn.svcci.file.damain.vo.DocumentsVO;
import cn.svcci.file.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件控制器
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
    public Result<String> uploadFileOss( @RequestParam("file") MultipartFile file) {
        // TODO: 封装请求参数
        FileUploadRequestDto fileUploadRequestDto = new FileUploadRequestDto();
        fileUploadRequestDto.setFile(file);
        fileUploadRequestDto.setUserId(UserContext.getUserId());
        return fileUploadService.uploadFileOss(fileUploadRequestDto);
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