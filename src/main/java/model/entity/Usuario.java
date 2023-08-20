package model.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usuarios")
public class Usuario {
	// se crean los atributos de la clase Usuario
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String fechaNacimiento;
	private String tipo;
	private Integer telefono;
	private String direccion;
	private String comuna;

	// se crea el constructor vacio
	public Usuario() {
	}

	// se crea el constructor con todos los atributos de la clase
	public Usuario(String fechaNacimiento, String tipo, Integer telefono, String direccion, String comuna) {
		super();
		this.tipo = tipo;
		this.fechaNacimiento = fechaNacimiento;
		this.telefono = telefono;
		this.direccion = direccion;
		this.comuna = comuna;
	}

	// se crean los metodos de acceso y modificadores de yodos los atributos
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipo() {
		return tipo;
	}

	public boolean setTipo(String tipo) {
		if (tipo.equals("Cliente") || tipo.equals("voluntario")) {
			this.tipo = tipo;
			return true; // El tipo se estableció correctamente
		} else {
			return false; // El tipo es inválido
		}
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public boolean setFechaNacimiento(String fechaNacimiento) {
		if (fechaNacimiento == null) {
			return false; // La fecha es nula, formato incorrecto
		}
		String formatoFecha = "dd/MM/yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(formatoFecha);
		sdf.setLenient(false); // Evita la flexibilidad en el análisis de fechas
		try {
			sdf.parse(fechaNacimiento);
			this.fechaNacimiento = fechaNacimiento;
			return true; // La fecha tiene el formato correcto y fue establecida correctamente
		} catch (ParseException e) {
			return false; // La fecha no tiene el formato correcto
		}
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public boolean setDireccion(String direccion) {
		if (direccion.length() < 71) {
			this.direccion = direccion;
			return true; // La direccion se estableció correctamente
		} else {
			return false; // La direccion es inválida
		}
	}

	public String getComuna() {
		return comuna;
	}

	public boolean setComuna(String comuna) {
		if (comuna.length() < 51) {
			this.comuna = comuna;
			return true; // La comuna se estableció correctamente
		} else {
			return false; // La comuna es inválida
		}
	}

	// se crea metodo toString
	public String toString() {
		return "Usuario [fechaDeNacimiento=" + fechaNacimiento + "]";
	}
	// falta desplegar rut en analizar usuario

	public void analizarUsuario() {
		System.out.println("Fecha de nacimiento: " + fechaNacimiento);
	}

	public void mostrarEdad() {
		LocalDate fechaNac = LocalDate.parse(fechaNacimiento, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		LocalDate ahora = LocalDate.now();
		Period periodo = Period.between(fechaNac, ahora);
		int edad = periodo.getYears();
		System.out.println("El usuario tiene " + edad + " años");
	}
}