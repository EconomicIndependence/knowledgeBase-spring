package cn.svcci.file.service.impl;

import cn.svcci.common.response.Result;
import cn.svcci.file.damain.entity.FileInfoDo;
import cn.svcci.file.damain.vo.DocumentsVO;
import cn.svcci.file.mapper.FileInfoDoMapper;
import cn.svcci.file.service.FileInfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class FileInfoServiceImpl extends ServiceImpl<FileInfoDoMapper, FileInfoDo> implements FileInfoService {

    private final FileInfoDoMapper fileInfoDoMapper;

    @Autowired
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
    public Result<List<DocumentsVO>> listAllFiles(Long userId) {

        // 创建条件构造器
        QueryWrapper<FileInfoDo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);

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

    @Override
    public Result<String> putFileInfo(Long userId) {

        return Result.success("文件元数据修改成功");
    }




}
