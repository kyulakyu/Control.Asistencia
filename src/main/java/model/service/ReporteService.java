package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Reporte;
import model.repository.IReporteRepository;

@Service
public class ReporteService {

    private final IReporteRepository reporteRepository;

    @Autowired
    public ReporteService(IReporteRepository reporteRepository) {
        this.reporteRepository = reporteRepository;
    }

    public List<Reporte> getReportes() {
        return reporteRepository.findAll();
    }

    public List<Reporte> getUltimosTresReportes() {
        List<Reporte> todasLasReportes = reporteRepository.findUltimasTresReportes();
        return limitarATres(todasLasReportes);
    }

    private List<Reporte> limitarATres(List<Reporte> reportes) {
        return reportes.subList(0, Math.min(reportes.size(), 3));
    }

    public void crearReportes(Reporte r, String detalle) {
        // Antes de guardar la capacitación, asignamos el detalle usando el método mostrarDetalle()
        r.getDetalle();
        reporteRepository.save(r);
    }
}