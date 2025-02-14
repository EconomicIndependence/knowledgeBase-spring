// src/main/java/cn/svcci/file/domain/vo/FileVO.java
package cn.svcci.file.damain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 文件视图对象
 * 用于返回给前端的文件信息
 */
@Data
@NoArgsConstructor  // 自动生成无参构造器
@AllArgsConstructor  // 自动生成全参构造器
public class DocumentsVO {
    private String fileId; // 文件ID唯一标识
    private String fileName; // 文件名
    private String filePath; // 文件存储路径
    private String uploadTime; // 上传时间（格式化为字符串）


}
