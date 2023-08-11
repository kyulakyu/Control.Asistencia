package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Capacitacion;
import model.repository.ICapacitacionRepository;

@Service
public class CapacitacionService {

    private final ICapacitacionRepository capacitacionRepository;

    @Autowired
    public CapacitacionService(ICapacitacionRepository capacitacionRepository) {
        this.capacitacionRepository = capacitacionRepository;
    }

    public List<Capacitacion> getCapacitaciones() {
        return capacitacionRepository.findAll();
    }

    public List<Capacitacion> getUltimasTresCapacitaciones() {
        List<Capacitacion> todasLasCapacitaciones = capacitacionRepository.findUltimasTresCapacitaciones();
        return limitarATres(todasLasCapacitaciones);
    }

    private List<Capacitacion> limitarATres(List<Capacitacion> capacitaciones) {
        return capacitaciones.subList(0, Math.min(capacitaciones.size(), 3));
    }

    public void crearCapacitaciones(Capacitacion c, String detalle) {
        // Antes de guardar la capacitación, asignamos el detalle usando el método mostrarDetalle()
        c.mostrarDetalle();
        capacitacionRepository.save(c);
    }
}