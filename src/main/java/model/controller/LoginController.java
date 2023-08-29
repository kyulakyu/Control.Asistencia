package model.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @GetMapping("/Login")
    public ModelAndView mostrarLogin() {
        return new ModelAndView("login");
    }

    @GetMapping("/error")
    public ModelAndView errorLogin() {
        return new ModelAndView("login", "error", "true");
    }

    @GetMapping("/logout")
    public ModelAndView logout() {
        return new ModelAndView("redirect:/");
    }
//
//    @PostMapping("/Inicio")
//    public ModelAndView inicio() {
//        if (isCliente() || isVoluntario() || isAdministrativo()) {
//            return new ModelAndView("Inicio");
//        } else {
//            return new ModelAndView("redirect:/");
//        }
//    }
//    
    private boolean isCliente() {
        return hasAuthority("Cliente");
    }

    private boolean isVoluntario() {
        return hasAuthority("Voluntario");
    }

    private boolean isAdministrativo() {
        return hasAuthority("Administrativo");
    }

    private boolean hasAuthority(String authority) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals(authority));
    }
}