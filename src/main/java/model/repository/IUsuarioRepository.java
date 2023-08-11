package model.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import model.entity.Administrativo;
import model.entity.Cliente;
import model.entity.Profesional;
import model.entity.Usuario;
@Repository
public interface IUsuarioRepository extends JpaRepository<Usuario, Integer>{
	@Query("SELECT u FROM Usuario u")
	List<Usuario> findByTipo(String tipo);
	@Query("SELECT c FROM Cliente c")
	List<Cliente> findAllClientes();
	@Query("SELECT a FROM Administrativo a")
    List<Administrativo> findAllAdministrativos();
	@Query("SELECT p FROM Profesional p")
    List<Profesional> findAllProfesionales();
}
