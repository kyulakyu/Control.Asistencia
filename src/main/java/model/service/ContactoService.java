package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Contacto;
import model.repository.IContactoRepository;

@Service
public class ContactoService {
    @Autowired
    private IContactoRepository contactoRepository;

    public ContactoService() {
        super();
    }

    public Contacto crearContacto(Contacto contacto) {
        return contactoRepository.save(contacto);
    }
}
