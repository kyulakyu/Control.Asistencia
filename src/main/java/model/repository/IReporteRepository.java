package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Reporte;

public interface IReporteRepository extends JpaRepository<Reporte, Integer>{

    @Query("SELECT r FROM Reporte r ORDER BY r.id DESC")
    List<Reporte> findUltimasTresReportes();
}