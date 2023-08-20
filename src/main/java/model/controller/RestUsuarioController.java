package model.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import model.entity.Asistencia; // Importar la clase Asistencia
import model.entity.Boletin;
import model.entity.Cliente;
import model.entity.Reporte;
import model.service.AsistenciaService; // Importar el servicio AsistenciaService
import model.service.BoletinService;
import model.service.UsuarioService;
import model.service.ReporteService;

@RestController
public class RestUsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private AsistenciaService asistenciaService; // Inyectar el servicio AsistenciaService

    @Autowired
	private ReporteService reporteService;
    
    @Autowired
	private BoletinService boletinService;

    @RequestMapping(value="/api/clientes", headers="Accept=application/json")
    public List<Cliente> getAllClientes(){
        return usuarioService.getAllClientes();
    }
    
    @RequestMapping(value="/api/asistencias", headers="Accept=application/json")
    public List<Asistencia> getTresAsistencias(){
        return asistenciaService.getUltimasTresAsistencias(); // Llamar al método getCapacitaciones() del servicio AsistenciaService
    }

	@RequestMapping(value = "/api/reportes", headers = "Accept=application/json")
	public List<Reporte> getTresReportes() {
		return reporteService.getUltimosTresReportes(); // Llamar al método getReportes() del servicio ReportesService
	}
	@RequestMapping(value = "/api/boletines", headers = "Accept=application/json")
	public List<Boletin> getTresBoletines() {
		return boletinService.getUltimosTresBoletines(); // Llamar al método getReportes() del servicio ReportesService
	}
}
