package cn.svcci.file.controller;

import cn.svcci.common.response.Result;
import cn.svcci.common.utils.UserContext;
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

@RequestMapping("api/files")
public class FileInfoController {

    private final FileInfoService fileInfoService;

    @Autowired
    public FileInfoController(FileInfoService fileInfoService) {

        this.fileInfoService = fileInfoService;
    }

    @GetMapping("/DownloadFile/{fileId}")
    public Result<String> downloadFile(@PathVariable("fileId") String fileId) {

        return fileInfoService.downloadFileById(fileId);
    }


    /**
     *
     * 查询文件内容
     */
    @GetMapping("/{fileId}")
    public Result<DocumentsVO> getFile(@PathVariable("fileId") String fileId) {

        return fileInfoService.getFileById(fileId);

    }

    /**
     * 查询全部文件接口
     */
    @GetMapping("/allFile")
    public Result<List<DocumentsVO>> getAllFiles(
            @RequestParam(defaultValue = "1") Integer pageNo, // 当前页，默认为1
            @RequestParam(defaultValue = "10") Integer pageSize // 每页显示条数，默认为10
    ) {
        log.info("当前分页参数：pageNo = {}, pageSize = {}", pageNo, pageSize);
        return fileInfoService.listAllFiles(pageNo, pageSize);
//        pageNo, pageSize
    }

    /**
     * 修改文件元数据接口
     * @param fileId
     * @return
     */
    @PutMapping("/updateFile")
    public Result<String> putFileInfo(String fileId) {
        return fileInfoService.putFileInfo(fileId);
    }

    /**
     * 删除文件接口
     * @param fileId 文件ID
     * @return 删除结果
     */
    @DeleteMapping("/deleteFile/{fileId}")
    public Result<String> deleteFile(@PathVariable("fileId") String fileId) {
        return fileInfoService.deleteFile(fileId);
    }
}