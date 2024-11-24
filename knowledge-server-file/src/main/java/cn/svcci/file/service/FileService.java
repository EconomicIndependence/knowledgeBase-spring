package cn.svcci.file.service;



import cn.svcci.file.damain.dto.FileTextResponseDto;
import cn.svcci.file.damain.dto.FileUploadRequestDto;
import cn.svcci.file.result.Result;

import java.util.List;

public interface FileService {

    /**
     * 上传文件
     * @param file 要上传的文件
     * @return 操作结果
     */
    Result<String> uploadFileOss(FileUploadRequestDto file);


    Result<String> uploadFileLocal(FileUploadRequestDto file);
    /**
     * 根据文件ID获取文件信息
     *
     * @param fileId 文件ID
     * @return 文件信息
     */
    Result<FileTextResponseDto> getFileById(String fileId);

    /**
     * 获取所有文件列表
     *
     * @return 文件列表
     */
    Result<List<FileTextResponseDto>> getAllFiles();

    /**
     * 删除文件
     * @param fileId 文件ID
     * @return 操作结果
     */
    Result<String> deleteFile(String fileId);


}
