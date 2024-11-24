// src/main/java/cn/svcci/file/domain/vo/FileVO.java
package cn.svcci.file.damain.vo;

import lombok.Data;

/**
 * 文件视图对象
 * 用于返回给前端的文件信息
 */
@Data
public class FileVO {
    private String fileName; // 文件名
    private String filePath; // 文件存储路径
    private Long fileSize; // 文件大小（字节）
    private String uploadTime; // 上传时间（格式化为字符串）
}
