//package cn.svcci.api.client;
//
//import cn.svcci.common.response.Result;
//import cn.svcci.file.damain.vo.DocumentsVO;
//import org.springframework.cloud.openfeign.FeignClient;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@FeignClient(name = "file-service", url = "http://localhost:8082")  // 替换为服务发现的地址
//public interface FileServiceFeignClient {
//
//    @GetMapping("/files/{fileId}")
//    Result<DocumentsVO> getFile(@PathVariable("fileId") String fileId);
//
//    @GetMapping("/files/allFile")
//    Result<List<DocumentsVO>> getAllFiles(@RequestParam("userId") Long userId);
//
//    @PutMapping("/files/updateFile")
//    Result<String> updateFileInfo(@RequestParam("userId") Long userId);
//
//    @DeleteMapping("/files/{fileId}")
//    Result<String> deleteFile(@PathVariable("fileId") String fileId);
//}
