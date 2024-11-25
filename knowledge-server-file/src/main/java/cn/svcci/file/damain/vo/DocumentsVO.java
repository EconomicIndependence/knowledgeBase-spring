// src/main/java/cn/svcci/file/domain/vo/FileVO.java
package cn.svcci.file.damain.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 文件视图对象
 * 用于返回给前端的文件信息
 */
@Data
public class DocumentsVO {
    private String fileName; // 文件名
    private String filePath; // 文件存储路径
    private String uploadTime; // 上传时间（格式化为字符串）

    public DocumentsVO(String fileId, String fileName, LocalDateTime uploadTime) {
        this.fileName = fileName;
        this.fileName = fileName;

        // 格式化日期为字符串
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.uploadTime = uploadTime.format(formatter);
    }
}
