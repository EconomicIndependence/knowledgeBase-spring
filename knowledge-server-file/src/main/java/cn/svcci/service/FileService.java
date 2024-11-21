package cn.svcci.service;

import cn.svcci.entity.File;
import cn.svcci.result.Result;

import java.util.List;

public interface FileService {

    /**
     * 上传文件
     * @param file 要上传的文件
     * @return 操作结果
     */
    Result uploadFile(File file);

    /**
     * 根据文件ID获取文件信息
     * @param fileId 文件ID
     * @return 文件信息
     */
    File getFileById(String fileId);

    /**
     * 获取所有文件列表
     * @return 文件列表
     */
    List<File> getAllFiles();

    /**
     * 删除文件
     * @param fileId 文件ID
     * @return 操作结果
     */
    Result deleteFile(String fileId);
}
