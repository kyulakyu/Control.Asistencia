package model.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import model.entity.Contacto;
import model.service.ContactoService;

@Controller
public class ContactoController {
    @Autowired
    private ContactoService contactoService;

    @RequestMapping(path = "/Contacto", method = RequestMethod.GET)
    public String mostrarFormularioContacto(Model model) {
        model.addAttribute("contacto", new Contacto()); // Prepara un objeto Contacto en el modelo
        return "contacto";
    }

    @RequestMapping(path = "/CrearContacto", method = RequestMethod.POST)
    public String crearContacto(@ModelAttribute Contacto contacto) {
        contactoService.crearContacto(contacto);
        return "redirect:/";
    }
}