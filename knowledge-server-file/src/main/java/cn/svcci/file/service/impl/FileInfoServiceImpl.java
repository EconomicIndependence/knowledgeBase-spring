package cn.svcci.file.service.impl;

import cn.svcci.common.response.Result;
import cn.svcci.file.damain.entity.FileInfoDo;
import cn.svcci.file.damain.vo.DocumentsVO;
import cn.svcci.file.mapper.FileInfoDoMapper;
import cn.svcci.file.service.FileInfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
public class FileInfoServiceImpl extends ServiceImpl<FileInfoDoMapper, FileInfoDo> implements FileInfoService {

    // 定义合法的文件后缀名常量
    private static final List<String> VALID_FILE_EXTENSIONS = Arrays.asList("txt", "md", "doc", "docx", "pdf");

    // 注入文件上传的最大大小属性，单位为字节，若handler.upload.max-size未配置，则默认为100MB
    @Value("${file.upload.max-size:104857600}")
    private long maxFileSize;

    private final FileInfoDoMapper fileInfoDoMapper;

    public FileInfoServiceImpl(FileInfoDoMapper fileInfoDoMapper) {

        this.fileInfoDoMapper = fileInfoDoMapper;
    }


    // 下载文件
    @Override
    public Result<DocumentsVO> getFileById(String fileId) {

        return Result.success();
    }

    // 获取所有文件
    @Override
    public Result<List<DocumentsVO>> listAllFiles(Long fileId) {

        // 创建条件构造器
        QueryWrapper<FileInfoDo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("file_id", fileId);

        // 执行查询
        List<FileInfoDo> fileInfoList = fileInfoDoMapper.selectList(queryWrapper);
        // 将查询结果转换为 VO 对象
        List<DocumentsVO> documentsVOList = fileInfoList.stream()
                .map(fileInfo -> new DocumentsVO(fileInfo.getFileName(), fileInfo.getFilePath(),fileInfo.getUploadTime()))
                .collect(Collectors.toList());

        // 返回封装的结果
        return Result.success(documentsVOList);
    }

    // 删除文件
    @Override
    public Result<String> deleteFile(String fileId) {
        int rows = fileInfoDoMapper.deleteById(fileId);
        if (rows > 0) {
            return Result.success("文件删除成功");
        }

        return Result.error("文件删除失败");
    }


    // 本地上传文件
//    public Result<String> uploadFile(String user, MultipartFile file) {
//        // 判断文件是否合法
//        Result<String> validationResult = validateFile(file);
//        if (!validationResult.isSuccess()) {
//            return validationResult;
//        }
//
//        // 保存文件
//        String fileName = file.getOriginalFilename();
//        String filePath = "./upload/" + user + "/" + fileName;
//        try {
//            // 创建上传目录
//            file.transferTo(new File(filePath));
//        } catch (Exception e) {
//            log.error("上传文件失败", e);
//            return Result.error("上传文件失败");
//        }
//
//        log.info("用户{}上传文件成功: 文件名：{}，文件路径：{}", user, fileName, filePath);
//        return Result.success("上传成功");
//    }




    // 验证文件
    private Result<String> validateFile(MultipartFile file) {
        // 判断文件是否为空
        if (file.isEmpty()) {
            log.error("文件为空");
            return Result.error("文件为空");
        }

        // 判断文件类型和大小
        if (!isValidFileType(file) || file.getSize() > maxFileSize) {
            log.error("文件类型不正确或文件大小超过限制");
            return Result.error("文件类型不正确或文件大小超过限制");
        }

        return Result.success("文件验证通过");
    }


    // 判断文件类型是否合法
    private boolean isValidFileType(MultipartFile file) {
        String contentType = file.getContentType();
        String fileName = file.getOriginalFilename();

        // 定义合法的文件后缀名
        //hashset效率高于arraylist
        Set<String> validExtensions = new HashSet<>(VALID_FILE_EXTENSIONS);
        String fileExtension = getFileExtension(fileName);

        // 检查后缀和 MIME 类型
        return validExtensions.contains(fileExtension) && isValidMimeType(contentType);
    }

    // 判断 MIME 类型是否合法
    private boolean isValidMimeType(String contentType) {
        return "application/pdf".equals(contentType) ||
                "application/msword".equals(contentType) ||
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document".equals(contentType) ||
                "text/plain".equals(contentType) ||
                "text/markdown".equals(contentType) ||
                "text/x-markdown".equals(contentType);
    }

    // 获取文件后缀名
    private String getFileExtension(String fileName) {
        int lastIndex = fileName.lastIndexOf('.');
        return (lastIndex > 0 && lastIndex < fileName.length() - 1) ? fileName.substring(lastIndex + 1).toLowerCase() : "";
    }

}
