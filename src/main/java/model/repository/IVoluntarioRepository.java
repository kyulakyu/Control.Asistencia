package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import model.entity.Voluntario;

public interface IVoluntarioRepository  extends JpaRepository<Voluntario, Integer>{

	 @Query("SELECT v FROM Voluntario v WHERE v.tipo = 'Voluntario'")
   List<Voluntario> findAllVoluntarios();	 
}