package cn.svcci.controller;

import cn.svcci.entity.File;
import cn.svcci.result.Result;
import cn.svcci.service.FileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 文件上传控制器
 */

@Slf4j
@RestController

@RequestMapping("/files")
public class FileController {

    @Autowired
    private FileService fileService;

    @PostMapping("/upload")
    public Result uploadFile(@RequestBody File file) {
        return fileService.uploadFile(file);
    }

    @GetMapping("/{fileId}")
    public File getFile(@PathVariable("fileId") String fileId) {
        return fileService.getFileById(fileId);
    }

    @GetMapping("/all")
    public List<File> getAllFiles() {
        return fileService.getAllFiles();
    }

    @DeleteMapping("/{fileId}")
    public Result deleteFile(@PathVariable("fileId") String fileId) {
        return fileService.deleteFile(fileId);
    }
}