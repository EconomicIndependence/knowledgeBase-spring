package cn.svcci.file.service;

import cn.svcci.common.response.Result;
import cn.svcci.file.damain.dto.FileUploadRequestDto;

public interface FileUploadService {

    /**
     * 上传文件
     * @param file 要上传的文件
     * @return 操作结果
     */
    Result<String> uploadFileOss(FileUploadRequestDto file);


    Result<String> uploadFileLocal(FileUploadRequestDto file);

}
