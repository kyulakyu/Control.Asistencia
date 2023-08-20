package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Asistencia;
import model.service.AsistenciaService;

@Controller
public class AsistenciaController {

    @Autowired
    private AsistenciaService cs;

    @Autowired
    private RestUsuarioController restUsuarioController; // Inyectar el servicio RestUsuarioController

    /**
     * Maneja las solicitudes que se le hacen a la raíz del sitio
     * 
     * @return un objeto {@link ModelAndView} con la respuesta al cliente
     */
    @RequestMapping(path = "/CrearAsistencia", method = RequestMethod.GET)
    public ModelAndView mostrarCrearAsistencia() {
        return new ModelAndView("crearAsistencia");
    }

    @RequestMapping(path = "/ListarAsistencias", method = RequestMethod.GET)
    public ModelAndView mostrarListarAsistencias() {
        // Obtener la lista de asistencias desde el servicio AsistenciaService
        List<Asistencia> asistencias = cs.getAsistencias();

        ModelAndView modelAndView = new ModelAndView("listarAsistencias", "asistencias", asistencias);
        return modelAndView;
    }

    @RequestMapping(path = "/CrearAsistencia", method = RequestMethod.POST)
    public ModelAndView crearAsistencia(Asistencia asistencia) {
        try {
            String detalle = asistencia.getDetalle(); // Obtenemos el detalle utilizando el método mostrarDetalle()
            asistencia.setDetalle(detalle); // Establecemos el detalle en el objeto Asistencia
            cs.crearAsistencias(asistencia, detalle); // Guardamos la capacitación en la base de datos (asegúrate de que el método crearAsistencias solo reciba la instancia de Asistencia)

            // Obtener la lista de asistencias en formato JSON desde el servicio RestUsuarioController
            List<Asistencia> asistenciasJson = restUsuarioController.getTresAsistencias();

            // Agregar la lista de asistencias JSON al modelo para que esté disponible en la vista listaAsistenciasJson.jsp
            ModelAndView jsonModelAndView = new ModelAndView("listaAsistenciasJson");
            jsonModelAndView.addObject("asistenciasJson", asistenciasJson);

            return jsonModelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("error");
        }
    }
}
