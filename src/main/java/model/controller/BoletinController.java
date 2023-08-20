package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Boletin;
import model.service.BoletinService;

@Controller
public class BoletinController {

    @Autowired
    private BoletinService cs;

    @Autowired
    private RestUsuarioController restUsuarioController; // Inyectar el servicio RestUsuarioController

    /**
     * Maneja las solicitudes que se le hacen a la raíz del sitio
     * 
     * @return un objeto {@link ModelAndView} con la respuesta al cliente
     */
    @RequestMapping(path = "/CrearBoletin", method = RequestMethod.GET)
    public ModelAndView mostrarCrearBoletin() {
        return new ModelAndView("crearBoletin");
    }

    @RequestMapping(path = "/ListarBoletines", method = RequestMethod.GET)
    public ModelAndView mostrarListarBoletines() {
        // Obtener la lista de asistencias desde el servicio BoletinService
        List<Boletin> asistencias = cs.getBoletines();

        ModelAndView modelAndView = new ModelAndView("listarBoletines", "asistencias", asistencias);
        return modelAndView;
    }

    @RequestMapping(path = "/CrearBoletin", method = RequestMethod.POST)
    public ModelAndView crearBoletin(Boletin asistencia) {
        try {
            String detalle = asistencia.getDetalle(); // Obtenemos el detalle utilizando el método mostrarDetalle()
            asistencia.setDetalle(detalle); // Establecemos el detalle en el objeto Boletin
            cs.crearBoletines(asistencia, detalle); // Guardamos la capacitación en la base de datos (asegúrate de que el método crearBoletines solo reciba la instancia de Boletin)

            // Obtener la lista de asistencias en formato JSON desde el servicio RestUsuarioController
            List<Boletin> asistenciasJson = restUsuarioController.getTresBoletines();

            // Agregar la lista de asistencias JSON al modelo para que esté disponible en la vista listaBoletinesJson.jsp
            ModelAndView jsonModelAndView = new ModelAndView("listaBoletinesJson");
            jsonModelAndView.addObject("asistenciasJson", asistenciasJson);

            return jsonModelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("error");
        }
    }
}
