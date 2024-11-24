//package cn.svcci.user.controller;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.cloud.context.config.annotation.RefreshScope;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/config")
//@RefreshScope
//public class ConfigController {
//
//    @Value("${kn.log.name}")
//    private String useLocalCache;
//
//    @RequestMapping("/get")
//    public boolean get() {
//        return useLocalCache;
//    }
//}