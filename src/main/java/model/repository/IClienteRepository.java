package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Cliente;

public interface IClienteRepository extends JpaRepository<Cliente, Integer>{

	 @Query("SELECT c FROM Cliente c WHERE c.tipo = 'Cliente'")
   List<Cliente> findAllClientes();
}