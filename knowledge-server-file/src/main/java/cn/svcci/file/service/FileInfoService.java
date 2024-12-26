package cn.svcci.file.service;


import cn.svcci.common.response.Result;
import cn.svcci.file.damain.entity.FileInfoDo;
import cn.svcci.file.damain.vo.DocumentsVO;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.tomcat.jni.FileInfo;

import java.util.List;

public interface FileInfoService extends IService<FileInfoDo> {

       /**
     * 根据文件ID获取文件信息
     *
     * @param fileId 文件ID
     * @return 文件信息
     */
    Result<DocumentsVO> getFileById(String fileId);

    /**
     * 获取所有文件列表
     *
     * @return 文件列表
     */
    Result<List<DocumentsVO>> listAllFiles(Long userId);

    /**
     * 删除文件
     * @param fileId 文件ID
     * @return 操作结果
     */
    Result<String> deleteFile(String fileId);


    Result<String> putFileInfo(String fileId);



}
