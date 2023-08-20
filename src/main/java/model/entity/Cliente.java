package model.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "clientes")
@DiscriminatorValue("cliente")
public class Cliente extends Usuario {
	// se crean los atributos de la clase Cliente
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private Integer rut;
	private String nombre;

	public Cliente() {
	}

//se crea el constructor con todos los atributos de la clase
	public Cliente(String fechaDeNacimiento, String tipo, Integer telefono, String direccion, String comuna,
			Integer rut, String nombre) {
		super(fechaDeNacimiento, tipo, telefono, direccion, comuna);
		this.rut = rut;
		this.setNombre(nombre);
	}
//se crean los metodos de acceso y modificadores de yodos los atributos

	public Integer getRut() {
		return rut;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setRut(Integer rut) {
		this.rut = rut;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setRut(int rut) {
		this.rut = rut;
	}

//se crea metodo toString

	public String toString() {
		return super.toString() + " Cliente [rut=" + rut + ", nombre=" + nombre + "]";
	}

	public void analizarUsuario() {
		super.analizarUsuario();
		System.out.println("Tipo de usuario: Cliente");
		// Mostrar los datos específicos del cliente
		System.out.println("RUT: " + rut);
		System.out.println("Nombre: " + nombre);
	}
}