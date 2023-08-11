package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import model.entity.Contacto;

@Repository
public interface IContactoRepository extends JpaRepository<Contacto, Integer> {

}