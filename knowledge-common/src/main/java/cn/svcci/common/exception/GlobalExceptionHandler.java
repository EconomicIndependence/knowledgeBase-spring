package cn.svcci.common.exception;

import cn.svcci.common.response.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 全局异常处理类
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    // 处理验证失败的异常（如 @Valid 验证失败，不符合约束条件等）
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST) // 返回 400 状态码
    public Result<String> handleValidationException(MethodArgumentNotValidException ex) {
        // 获取错误信息
        BindingResult bindingResult = ex.getBindingResult();
        List<FieldError> fieldErrors = bindingResult.getFieldErrors();

        // 拼接字段错误信息
        String errorMessage = fieldErrors.stream()
                .map(error -> error.getField() + ": " + error.getDefaultMessage())
                .collect(Collectors.joining("; "));

        // 记录日志，打印详细的错误信息
        log.error("请求参数验证失败: {}", errorMessage);

        // 返回自定义的错误结果
        return Result.error(errorMessage);
    }

    // 处理数据库的唯一约束异常（如用户名或邮箱已存在）
    @ExceptionHandler(DuplicateKeyException.class)
    public ResponseEntity<Result<String>> handleDuplicateKeyException(DuplicateKeyException ex) {
        // 记录详细的异常信息
        log.error("数据库唯一约束冲突: {}", ex.getMessage());

        // 返回错误响应
        Result<String> result = Result.error("用户名或邮箱已存在");
        return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
    }

    // 处理通用异常
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Result<String>> handleException(Exception ex) {
        // 记录详细的异常信息，包括堆栈
        log.error("服务器内部错误: ", ex);

        // 返回通用的错误响应
        Result<String> result = Result.error("服务器内部错误: " + ex.getMessage());
        return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
