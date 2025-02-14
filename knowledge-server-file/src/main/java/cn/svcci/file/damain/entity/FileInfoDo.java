// src/main/java/cn/svcci/file/domain/entity/FileInfo.java
package cn.svcci.file.damain.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 文件信息实体类
 * 映射数据库的 file_info 表
 *
 */
@Data
@TableName("file_info")
public class FileInfoDo {
    @TableId
    private String fileId; // 文件唯一标识
    private String userName; // 上传者用户昵称
    private Long userId; // 上传者用户 ID
    private String fileName; // 文件名
    private String filePath; // 文件存储路径
    private String ossUrl; // 文件访问 URL
    private Long fileSize; // 文件大小（字节）
    private String fileType; // 文件类型（MIME 类型）
    private LocalDateTime uploadTime; // 上传时间
    private Integer status; // 文件状态（0：正常，1：已删除，2：回收站）
    private Boolean isPublic; // 是否公开
    private String tags; // 文件标签（JSON 格式存储）
    private String hash; // 文件哈希值（用于去重）
    private String metadata; // 文件元信息（JSON 格式）
    private String featureVector; // 向量数据（JSON 格式，用于向量搜索）
}
