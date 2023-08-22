package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Boletin;
import model.repository.IBoletinRepository;

@Service
public class BoletinService {

    private final IBoletinRepository boletinRepository;

    @Autowired
    public BoletinService(IBoletinRepository boletinRepository) {
        this.boletinRepository = boletinRepository;
    }

    public List<Boletin> getBoletines() {
        return boletinRepository.findAll();
    }

    public List<Boletin> getUltimosTresBoletines() {
        List<Boletin> todosLosBoletines = boletinRepository.findUltimosTresBoletines();
        return limitarATres(todosLosBoletines);
    }

    private List<Boletin> limitarATres(List<Boletin> boletines) {
        return boletines.subList(0, Math.min(boletines.size(), 3));
    }

    public void crearBoletines(Boletin b, String detalle) {
        // Antes de guardar el boletín, asignamos el detalle usando el método setDetalle()
        b.setDetalle(detalle);
        boletinRepository.save(b);
    }
}
