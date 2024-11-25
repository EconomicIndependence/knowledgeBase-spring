package cn.svcci.file.controller;

import cn.svcci.common.response.Result;
import cn.svcci.file.damain.vo.DocumentsVO;

import cn.svcci.file.service.FileInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 文件管理控制器
 */

@Slf4j
@RestController

@RequestMapping("/files")
public class FileInfoController {

    private final FileInfoService fileInfoService;

    @Autowired
    public FileInfoController(FileInfoService fileInfoService) {
        this.fileInfoService = fileInfoService;
    }
    /**
     *
     * 查询文件
     */
    @GetMapping("/{fileId}")
    public Result<DocumentsVO> getFile(@PathVariable("fileId") String fileId) {
        return fileInfoService.getFileById(fileId);
    }
    /**
     * 查询全部文件接口
     */
    @GetMapping("/allFile")
    public Result<List<DocumentsVO>> getAllFiles(Long userId) {

        return fileInfoService.listAllFiles(userId);
    }

    /**
     * 删除文件接口
     * @param fileId 文件ID
     * @return 删除结果
     */
    @DeleteMapping("/{fileId}")
    public Result<String> deleteFile(@PathVariable("fileId") String fileId) {
        return fileInfoService.deleteFile(fileId);
    }
}