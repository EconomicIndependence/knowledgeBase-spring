//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//public class Test {
//    private static PasswordEncoder passwordEncoder;
//
//    // 构造函数注入 PasswordEncoder
//    public Test(PasswordEncoder passwordEncoder) {
//        Test.passwordEncoder = passwordEncoder;
//    }
//
//    public static void main(String[] args) {
//        // 手动实例化 PasswordEncoder（模拟 Spring 注入）
//        passwordEncoder = new BCryptPasswordEncoder();
//
//        // 加密密码
//        String encryptedPassword = passwordEncoder.encode("250927");
//        System.out.println("加密后的密码: " + encryptedPassword);
//    }
//}
