package model.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String crearContacto(@ModelAttribute Contacto contacto, RedirectAttributes redirectAttributes) {
        Contacto nuevoContacto = contactoService.crearContacto(contacto);
        if (nuevoContacto != null) {
            redirectAttributes.addFlashAttribute("mensaje", "La información fue enviada correctamente.");
        } else {
            redirectAttributes.addFlashAttribute("mensaje", "No se pudo enviar la información.");
        }
        return "redirect:/Contacto";
    }
    
}