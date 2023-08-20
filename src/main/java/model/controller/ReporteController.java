package model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.entity.Reporte;
import model.service.ReporteService;

@Controller
public class ReporteController {

    @Autowired
    private ReporteService cs;

    @Autowired
    private RestUsuarioController restUsuarioController; // Inyectar el servicio RestUsuarioController

    /**
     * Maneja las solicitudes que se le hacen a la raíz del sitio
     * 
     * @return un objeto {@link ModelAndView} con la respuesta al cliente
     */
    @RequestMapping(path = "/CrearReporte", method = RequestMethod.GET)
    public ModelAndView mostrarCrearReporte() {
        return new ModelAndView("crearReporte");
    }

    @RequestMapping(path = "/ListarReportes", method = RequestMethod.GET)
    public ModelAndView mostrarListarReportes() {
        // Obtener la lista de reportes desde el servicio ReporteService
        List<Reporte> reportes = cs.getReportes();

        ModelAndView modelAndView = new ModelAndView("listarReportes", "reportes", reportes);
        return modelAndView;
    }

    @RequestMapping(path = "/CrearReporte", method = RequestMethod.POST)
    public ModelAndView crearReporte(Reporte reporte) {
        try {
            String detalle = reporte.getDetalle(); // Obtenemos el detalle utilizando el método mostrarDetalle()
            reporte.setDetalle(detalle); // Establecemos el detalle en el objeto Reporte
            cs.crearReportes(reporte, detalle); // Guardamos la capacitación en la base de datos (asegúrate de que el método crearReportes solo reciba la instancia de Reporte)

            // Obtener la lista de reportes en formato JSON desde el servicio RestUsuarioController
            List<Reporte> reportesJson = restUsuarioController.getTresReportes();

            // Agregar la lista de reportes JSON al modelo para que esté disponible en la vista listaReportesJson.jsp
            ModelAndView jsonModelAndView = new ModelAndView("listaReportesJson");
            jsonModelAndView.addObject("reportesJson", reportesJson);

            return jsonModelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error adecuadamente, redirigir a una página de error o mostrar un mensaje de error en la vista.
            return new ModelAndView("error");
        }
    }
}
