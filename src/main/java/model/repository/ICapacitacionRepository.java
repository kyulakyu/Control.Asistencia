package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Capacitacion;

public interface ICapacitacionRepository extends JpaRepository<Capacitacion, Integer>{

    @Query("SELECT c FROM Capacitacion c ORDER BY c.id DESC")
    List<Capacitacion> findUltimasTresCapacitaciones();
}