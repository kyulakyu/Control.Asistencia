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
    private ReporteService rs;

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
        List<Reporte> reportes = rs.getReportes();

        ModelAndView modelAndView = new ModelAndView("listarReportes", "reportes", reportes);
        return modelAndView;
    }

    @RequestMapping(path = "/CrearReporte", method = RequestMethod.POST)
    public ModelAndView crearReporte(Reporte reporte) {
        try {
            String detalle = reporte.getDetalle();
            reporte.setDetalle(detalle);
            rs.crearReportes(reporte, detalle);

            // Redirigir al usuario a la página "crearReporte" después de guardar el reporte
            return new ModelAndView("redirect:/CrearReporte");
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("error");
        }
    }
}
