package cn.svcci.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

/**
 * 文件实体类
 * @author rwwr
 * @version 1.0.0
 */

@AllArgsConstructor
@NoArgsConstructor
@Data
public class File {

    @Id
    private Integer id;        // 主键
    private String fileName;    // 文件名
    private String filePath;    // 文件路径
    private String uploadTime;  // 上传时间
    private Integer userId;     // 用户ID
    private String description; // 描述
}