package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Cliente;
import model.repository.IClienteRepository;


@Service
public class ClienteService {

	@Autowired
    private IClienteRepository clRepo;
  
  public ClienteService(IClienteRepository clRepo) {
       this.clRepo = clRepo;
    }
  public Cliente getClienteById(int id) {
        return clRepo.getOne(id);
       
    }
  
    public List<Cliente> getClientes() {
    
    	
    	return clRepo.findAllClientes();
        
    }
    public void update(Cliente c) {
		clRepo.save(c);
	}
    @Transactional
    public Cliente getClienteWithProperties(int id) {
        Cliente cliente = clRepo.findById(id).orElse(null);
        
        if (cliente != null) {
            // Cargar propiedades relacionadas adicionales aquí
            cliente.getNombre(); // Ejemplo: Cargar la colección de roles
            
            // Puedes hacer más operaciones para cargar otras propiedades
            
            return cliente;
        }
        
        return null;
    }
}

