package cn.svcci.file.service.impl;

import cn.svcci.common.response.Result;
import cn.svcci.file.damain.dto.FileUploadRequestDto;
import cn.svcci.file.service.FileUploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class FileUploadServiceImpl implements FileUploadService {
    // 阿里云OSS上传文件
    @Override
    public Result<String> uploadFileOss(FileUploadRequestDto file) {
        // 阿里云OSS上传文件
        return Result.success("上传成功");
    }

    @Override
    public Result<String> uploadFileLocal(FileUploadRequestDto file) {
        // 本地上传文件
        return Result.success("上传成功");
    }

}
