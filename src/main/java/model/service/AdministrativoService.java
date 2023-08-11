package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Administrativo;

import model.repository.IAdministrativoRepository;


@Service
public class AdministrativoService {
	 @Autowired
	    private IAdministrativoRepository adRepo;
	  
	  public AdministrativoService(IAdministrativoRepository adRepo) {
	       this.adRepo = adRepo;
	    }
	  public Administrativo getAdministrativoById(int id) {
	        return adRepo.getOne(id);
	       
	    }
	  
	    public List<Administrativo> getAdministrativos() {
	    	System.out.println(adRepo.findAllAdministrativos());
	    	
	    	return adRepo.findAllAdministrativos();
	        
	    }
	    public void update(Administrativo a) {
			adRepo.save(a);
		}
	    @Transactional
	    public Administrativo getAdministrativoWithProperties(int id) {
	        Administrativo administrativo = adRepo.findById(id).orElse(null);
	        
	        if (administrativo != null) {
	            // Cargar propiedades relacionadas adicionales aquí
	            administrativo.getFechaNacimiento(); // Ejemplo: Cargar la colección de roles
	            
	            // Puedes hacer más operaciones para cargar otras propiedades
	            
	            return administrativo;
	        }
	        
	        return null;
	    }
}
