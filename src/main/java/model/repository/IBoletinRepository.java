package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Boletin;

public interface IBoletinRepository extends JpaRepository<Boletin, Integer>{

    @Query("SELECT b FROM Boletin b ORDER BY b.id DESC")
    List<Boletin> findUltimosTresBoletines();
}