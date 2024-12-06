package cn.svcci.api.decoder;

import cn.svcci.common.response.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import feign.Response;
import feign.codec.DecodeException;
import feign.codec.Decoder;

import java.io.IOException;
import java.lang.reflect.Type;

public class ResultDecoder implements Decoder {

    private final ObjectMapper objectMapper;

    public ResultDecoder(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public Object decode(Response response, Type type) throws IOException {
        // 获取响应体
        if (response.body() == null) {
            throw new DecodeException(response.status(), "响应体为空", response.request());
        }

        // 将响应体解析为 Result<T>
        Result<?> result;
        try (var inputStream = response.body().asInputStream()) {
            result = objectMapper.readValue(inputStream, objectMapper.getTypeFactory().constructType(Result.class));
        }

        // 检查 Result 的 code 字段
        if (result.getCode() == null || result.getCode() != 0) {
            throw new DecodeException(response.status(), "请求失败: " + result.getMsg(), response.request());
        }

        // 如果响应成功，解析内部的 data 字段
        return objectMapper.convertValue(result.getData(), objectMapper.getTypeFactory().constructType(type));
    }
}
