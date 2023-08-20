package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Boletin;
import model.repository.IBoletinRepository;

@Service
public class BoletinService {

    private final IBoletinRepository asistenciaRepository;

    @Autowired
    public BoletinService(IBoletinRepository asistenciaRepository) {
        this.asistenciaRepository = asistenciaRepository;
    }

    public List<Boletin> getBoletines() {
        return asistenciaRepository.findAll();
    }

    public List<Boletin> getUltimosTresBoletines() {
        List<Boletin> todasLasBoletines = asistenciaRepository.findUltimosTresBoletines();
        return limitarATres(todasLasBoletines);
    }

    private List<Boletin> limitarATres(List<Boletin> asistencias) {
        return asistencias.subList(0, Math.min(asistencias.size(), 3));
    }

    public void crearBoletines(Boletin b, String detalle) {
        // Antes de guardar la capacitación, asignamos el detalle usando el método mostrarDetalle()
        b.getDetalle();
        asistenciaRepository.save(b);
    }
}