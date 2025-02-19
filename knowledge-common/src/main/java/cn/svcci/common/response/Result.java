package cn.svcci.common.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 后端统一返回结果
 * @param <T>
 *     0成功，1和其它数字为失败
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> implements Serializable {

    private Integer code; //编码：0成功，1和其它数字为失败
    private String msg; //错误信息
    private T data; //数据

    public static <T> Result<T> success() {
        Result<T> result = new Result<T>();
        result.code = 0;
        return result;
    }

    public static <T> Result<T> success(T object) {
        Result<T> result = new Result<T>();
        result.data = object;
        result.code = 0;
        return result;
    }

    public static <T> Result<T> error(String msg) {
        Result<T> result = new Result<T>();
        result.msg = msg;
        result.code = 1;
        return result;
    }

    // 静态方法：判断是否成功
    public static boolean isSuccess(Result<?> result) {
        // 逻辑：null检查 + code必须为0
        return result != null && result.getCode() != null && result.getCode() == 0;
    }


}
