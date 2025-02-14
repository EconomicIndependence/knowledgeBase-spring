package cn.svcci.file.service.impl;

import cn.svcci.common.response.Result;
import cn.svcci.common.utils.UserContext;
import cn.svcci.file.converter.FileInfoConverter;
import cn.svcci.file.damain.entity.FileInfoDo;
import cn.svcci.file.damain.vo.DocumentsVO;
import cn.svcci.file.mapper.FileInfoDoMapper;
import cn.svcci.file.service.FileInfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
    public Result<List<DocumentsVO>> listAllFiles(Integer pageNo, Integer pageSize) {
        Long userId = UserContext.getUserId();

        // 创建条件构造器
        QueryWrapper<FileInfoDo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        // 创建分页对象
        Page<FileInfoDo> page = new Page<>(pageNo,pageSize);

        // 执行分页查询
        Page<FileInfoDo> fileInfoPage = fileInfoDoMapper.selectPage(page, queryWrapper);
        // 打印分页查询的结果（调试）
        System.out.println("Total Records: " + fileInfoPage.getTotal());  // 总记录数
        System.out.println("Current Page: " + pageNo);  // 当前页码
        System.out.println("Page Size: " + pageSize);  // 每页显示条数
        System.out.println("Total Pages: " + fileInfoPage.getPages());  // 总页数
        System.out.println("Records on Current Page: " + fileInfoPage.getRecords());  // 当前页的数据

        // 执行查询
//        List<FileInfoDo> fileInfoList = fileInfoDoMapper.selectList(queryWrapper);
        // 将查询结果转换为 VO 对象
        List<DocumentsVO> documentsVOList = FileInfoConverter.toDocumentsVOList(fileInfoPage.getRecords());

        // 返回封装的结果
        return Result.success(documentsVOList);
    }

    // 删除文件元数据
    // TODO: 文件本体关联删除待实现
    @Override
    public Result<String> deleteFile(String fileId) {
        int rows = fileInfoDoMapper.deleteById(fileId);
        if (rows > 0) {
            return Result.success("文件删除成功");
        }

        return Result.error("文件删除失败");
    }

    @Override
    public Result<String> putFileInfo(String fileId) {

        return Result.success("文件元数据修改成功");
    }

    // 下载文件
    @Override
    public Result<String> downloadFileById(String fileId) {
        // 创建条件构造器
        QueryWrapper<FileInfoDo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("file_id", fileId);

        // 执行查询
        FileInfoDo fileInfo = fileInfoDoMapper.selectOne(queryWrapper);
        String ossUrl = fileInfo.getOssUrl();
        return Result.success(ossUrl);
    }
}
