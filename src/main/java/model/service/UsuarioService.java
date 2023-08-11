package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Administrativo;
import model.entity.Cliente;
import model.entity.Profesional;
import model.entity.Usuario;
import model.repository.IUsuarioRepository;

@Service
public class UsuarioService {
    @Autowired
    private IUsuarioRepository usRepo;

    public UsuarioService() {
        super();
    }

    public List<Usuario> getUsuarios() {
        return usRepo.findAll();
    }

    public Usuario crearUsuario(Usuario u) {
        Usuario usuarioGuardado = null;

        if (u instanceof Cliente) {
            usuarioGuardado = usRepo.save((Cliente) u);
        } else if (u instanceof Profesional) {
            usuarioGuardado = usRepo.save((Profesional) u);
        } else if (u instanceof Administrativo) {
            usuarioGuardado = usRepo.save((Administrativo) u);
        } else {
            // Aquí puedes manejar cualquier otro tipo de usuario que puedas tener.
            throw new IllegalArgumentException("Tipo de usuario no válido.");
        }

        return usuarioGuardado;
    }

    public List<Usuario> getAllUsuarios() {
        return usRepo.findAll();
    }
    public List<Cliente> getAllClientes() {
        return usRepo.findAllClientes();
    }

    public List<Administrativo> getAllAdministrativos() {
        return usRepo.findAllAdministrativos();
    }
    
    
    
    
    
    
    
    
    
    

    public List<Profesional> getAllProfesionales() {
        return usRepo.findAllProfesionales();
    }
}

