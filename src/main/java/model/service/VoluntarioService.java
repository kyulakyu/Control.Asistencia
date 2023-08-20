package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Voluntario;
import model.repository.IVoluntarioRepository;

@Service
public class VoluntarioService {
	@Autowired
    private IVoluntarioRepository prRepo;
  
  public VoluntarioService(IVoluntarioRepository prRepo) {
       this.prRepo = prRepo;
    }
  public Voluntario getProfesionalById(int id) {
        return prRepo.getOne(id);
       
    }
  
    public List<Voluntario> getProfesional() {
    	
    	return prRepo.findAllVoluntarios();
        
    }
    public void update(Voluntario v) {
		prRepo.save(v);
	}
    @Transactional
    public Voluntario getVoluntarioWithProperties(int id) {
        Voluntario voluntario = prRepo.findById(id).orElse(null);
        
        if (voluntario != null) {
            // Cargar propiedades relacionadas adicionales aquí
            voluntario.getCargo(); // Ejemplo: Cargar la colección de roles
            // Puedes hacer más operaciones para cargar otras propiedades
            return voluntario;
        }
        return null;
    }
}

