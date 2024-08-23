package kr.co.sist.aak;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ImpAdminController {

    @GetMapping("/imp_admin_index.do")
    public String impAdminMain() {
        return "/admin/imp_login";
    }

    @PostMapping("/imp_admin_login.do")
    public String impAdmin() {
        return "/admin/imp_index";
    }




}
