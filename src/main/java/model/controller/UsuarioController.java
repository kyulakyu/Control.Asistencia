package model.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Administrativo;
import model.entity.Cliente;
import model.entity.Voluntario;
import model.entity.Usuario;
import model.service.UsuarioService;


@Controller
public class UsuarioController {
	@Autowired
	private UsuarioService us;

	@RequestMapping(path = "/CrearUsuario", method = RequestMethod.GET)
    public ModelAndView mostrarCrearCapacitacion() {
        return new ModelAndView("crearUsuario");
    }
    
	@RequestMapping(path = "/ListarUsuarios", method = RequestMethod.GET)
	public ModelAndView mostrarListarUsuario(@RequestParam(required = false) String tipo) {
		Map<String, List<? extends Usuario>> listarUsuarios = new HashMap<>();

	    
	    if (tipo == null || tipo.isEmpty() || tipo.equals("todos")) {
	        listarUsuarios.put("Cliente", us.getAllClientes());
	        listarUsuarios.put("Administrativo", us.getAllAdministrativos());
	        listarUsuarios.put("Voluntario", us.getAllProfesionales());
	    } else {
	        if (tipo.equals("Cliente")) {
	            listarUsuarios.put("Cliente", us.getAllClientes());
	        } else if (tipo.equals("Administrativo")) {
	            listarUsuarios.put("Administrativo", us.getAllAdministrativos());
	        } else if (tipo.equals("Voluntario")) {
	            listarUsuarios.put("Voluntario", us.getAllProfesionales());
	        }
	    }

	    return new ModelAndView("listarUsuarios", "listarUsuarios", listarUsuarios);
	}
	
//    	ModelAndView modelAndView = new ModelAndView("listarUsuarios");
//        modelAndView.addObject("usuarios", usuarios);
//        return modelAndView;
//    }  
    @RequestMapping(path = "/CrearUsuario", method = RequestMethod.POST)
    public ModelAndView crearUsuario(@RequestParam("tipo") String tipo,
                                      @RequestParam("rut") Integer rut,
                                      @RequestParam("nombres") String nombres,
                                      @RequestParam("apellidos") String apellidos,
                                      @RequestParam("telefono") Integer telefono,
                                      @RequestParam("direccion") String direccion,
                                      @RequestParam("comuna") String comuna,
                                      @RequestParam("nombre") String nombre,
                                      @RequestParam("fechaNacimiento") String fechaNacimiento,
                                      @RequestParam("run") int run,
                                      @RequestParam("runVoluntario") int runVoluntario,
                                      @RequestParam("cargo") String cargo,
                                      @RequestParam("fechaDeIngreso") String fechaDeIngreso,
                                      @RequestParam("clienteAdministrativo") String clienteAdministrativo) {
        try {
            int idGenerado = 0; // Inicializamos la variable idGenerado
            if ("Cliente".equals(tipo)) {
                Cliente cliente = new Cliente(fechaNacimiento, tipo, telefono, direccion, comuna, rut, nombre);
                Cliente clienteGuardado = (Cliente) us.crearUsuario(cliente);
                idGenerado = clienteGuardado.getId();
            } else if ("Voluntario".equals(tipo)) {
                Voluntario voluntario = new Voluntario(fechaNacimiento, tipo, telefono, direccion, comuna, runVoluntario, nombres, apellidos, cargo, fechaDeIngreso);
                Voluntario profesionalGuardado = (Voluntario) us.crearUsuario(voluntario);
                idGenerado = profesionalGuardado.getId();
            } else if ("Administrativo".equals(tipo)) {
                Administrativo administrativo = new Administrativo(fechaNacimiento, tipo, telefono, direccion, comuna, run, nombres, apellidos, clienteAdministrativo);
                Administrativo administrativoGuardado = (Administrativo) us.crearUsuario(administrativo);
                idGenerado = administrativoGuardado.getId();
            } else {
                // Manejar el caso de tipo desconocido o inválido
                throw new IllegalArgumentException("Tipo de usuario no válido.");
            }

            // Redirigir a la página de listar usuarios y pasar el idGenerado como parámetro
            return new ModelAndView("redirect:/ListarUsuarios", "idGenerado", idGenerado);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("error");
        }
    }

    @RequestMapping(path = "/ListarUsuariosConId", method = RequestMethod.GET)
    public ModelAndView mostrarListarUsuariosConId(@RequestParam(value = "idGenerado", required = false) Integer idGenerado) {
        List<Usuario> usuarios = us.getUsuarios();
        ModelAndView modelAndView = new ModelAndView("listarUsuarios", "usuarios", usuarios);
        modelAndView.addObject("idGenerado", idGenerado); // Agregar idGenerado al modelo
        return modelAndView;
    }
}