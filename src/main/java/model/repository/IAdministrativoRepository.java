package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Administrativo;


public interface IAdministrativoRepository  extends JpaRepository<Administrativo, Integer>{

	 @Query("SELECT a FROM Administrativo a WHERE a.tipo = 'Administrativo'")
    List<Administrativo> findAllAdministrativos();
	 
	 
}
