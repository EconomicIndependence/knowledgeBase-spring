package cn.svcci.file.converter;

import cn.svcci.file.damain.entity.FileInfoDo;
import cn.svcci.file.damain.vo.DocumentsVO;
import lombok.extern.slf4j.Slf4j;

import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
public class FileInfoConverter {

    // 将单个 FileInfoDo 转换为 DocumentsVO
    public static DocumentsVO toDocumentsVO(FileInfoDo fileInfoDo) {
        log.info("开始转换 FileInfoDo to DocumentsVO");
        if (fileInfoDo == null) {
            log.error("FileInfoDo 为空");
            return null;
        }
        DocumentsVO documentsVO = new DocumentsVO();
        documentsVO.setFileId(fileInfoDo.getFileId());
        documentsVO.setFileName(fileInfoDo.getFileName());
        documentsVO.setFilePath(fileInfoDo.getFilePath());
//        documentsVO.setUploadTime(fileInfoDo.getUploadTime().toString());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        documentsVO.setUploadTime(fileInfoDo.getUploadTime().format(formatter));
        log.info("转换完成: {}", documentsVO);
        return documentsVO;
    }

    // 将 FileInfoDo 的集合转换为 DocumentsVO 的集合
    public static List<DocumentsVO> toDocumentsVOList(Collection<FileInfoDo> fileInfoDoList) {
        log.info("开始转换 FileInfoDo 集合 to DocumentsVO 集合");
        if (fileInfoDoList == null || fileInfoDoList.isEmpty()) {
            log.error("FileInfoDo 集合为空");
            return Collections.emptyList();
        }
        List<DocumentsVO> documentsVOList = fileInfoDoList.stream()
                .map(FileInfoConverter::toDocumentsVO)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        log.info("转换完成，集合大小: {}", documentsVOList.size());
        return documentsVOList;
    }
}


