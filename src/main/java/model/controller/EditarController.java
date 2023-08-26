package model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.entity.Administrativo;
import model.entity.Cliente;
import model.entity.Voluntario;
import model.service.AdministrativoService;
import model.service.ClienteService;
import model.service.VoluntarioService;

@Controller
public class EditarController {
	@Autowired
	private AdministrativoService ad ;
	@Autowired
	private ClienteService cl;
	@Autowired
	private VoluntarioService pr;
	
	@GetMapping("/EditarVoluntario")
	  public String editarVoluntario(@RequestParam("id") int id, Model model) {
	          Voluntario voluntario = pr.getVoluntarioWithProperties(id);
	          if (voluntario != null) {
	              
	              model.addAttribute("voluntario", voluntario);
	              return "editarVoluntario"; // Nombre de la página de edición JSP
	          } else {
	              return "redirect:/"; // Redirigir si no se encuentra el administrativo
	          }
	  }

	  @GetMapping("/EditarAdministrativo")
	  public String editarAdministrativo(@RequestParam("id") int id, Model model) {
	          Administrativo administrativo = ad.getAdministrativoWithProperties(id);
	          if (administrativo != null) {
	              
	              model.addAttribute("administrativo", administrativo);
	              return "editarAdministrativo"; // Nombre de la página de edición JSP
	          } else {
	              return "redirect:/"; // Redirigir si no se encuentra el administrativo
	          }
	  }
	  
	  @GetMapping("/EditarCliente")
	  public String editarCliente(@RequestParam("id") int id, Model model) {
	          Cliente cliente = cl.getClienteWithProperties(id);
	          if (cliente != null) {
	              
	              model.addAttribute("cliente", cliente);
	              return "editarCliente"; // Nombre de la página de edición JSP
	          } else {
	              return "redirect:/"; // Redirigir si no se encuentra el administrativo
	          }
	  }

	    @PostMapping("/GuardarEdicionAdministrativo")
	    public String guardarEdicionAdministrativo(@ModelAttribute Administrativo administrativo) {
	        ad.update(administrativo);
	        return "redirect:/ListarUsuario"; // Redirigir después de guardar los cambios
	    }
	    
	    @PostMapping("/GuardarEdicionCliente")
	    public String guardarEdicionCliente(@ModelAttribute Cliente cliente) {
	        cl.update(cliente);
	        return "redirect:/ListarUsuario"; // Redirigir después de guardar los cambios
	    }
	    
	    @PostMapping("/GuardarEdicionVoluntario")
	    public String guardarEdicionVoluntario(@ModelAttribute Voluntario voluntario) {
	        pr.update(voluntario);
	        return "redirect:/ListarUsuario"; // Redirigir después de guardar los cambios
	    }
	    
}
