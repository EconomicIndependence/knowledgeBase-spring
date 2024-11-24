package cn.svcci.file.controller;

import cn.svcci.file.damain.dto.FileTextResponseDto;
import cn.svcci.file.damain.dto.FileUploadRequestDto;
import cn.svcci.file.result.Result;
import cn.svcci.file.service.FileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 文件上传控制器
 */

@Slf4j
@RestController

@RequestMapping("/files")
public class FileController {

    private final FileService fileService;

    @Autowired
    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    /**
     * 文件上传接口
     * Oss储存上传
     * @param file 文件对象
     * @return 上传结果
     */
    @PostMapping("/ossupload")
    public Result<String> uploadFileOss(@ModelAttribute FileUploadRequestDto file) {
        return fileService.uploadFileOss(file);
    }
    /**
     * 文件上传接口
     * 本地储存上传
     * @param file 文件对象
     * @return 上传结果
     */
    @PostMapping("/localupload")
    public Result<String> uploadFileLocal(@ModelAttribute FileUploadRequestDto file) {
        return fileService.uploadFileLocal(file);
    }

    @GetMapping("/{fileId}")
    public Result<FileTextResponseDto> getFile(@PathVariable("fileId") String fileId) {
        return fileService.getFileById(fileId);
    }

    @GetMapping("/all")
    public Result<List<FileTextResponseDto>> getAllFiles() {
        return fileService.getAllFiles();
    }

    /**
     * 删除文件接口
     * @param fileId 文件ID
     * @return 删除结果
     */
    @DeleteMapping("/{fileId}")
    public Result<String> deleteFile(@PathVariable("fileId") String fileId) {
        return fileService.deleteFile(fileId);
    }
}