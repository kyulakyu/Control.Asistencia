package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Asistencia;

public interface IAsistenciaRepository extends JpaRepository<Asistencia, Integer>{

    @Query("SELECT a FROM Asistencia a ORDER BY a.id DESC")
    List<Asistencia> findUltimasTresAsistencias();
}