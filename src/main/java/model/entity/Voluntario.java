package model.entity;

import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@DiscriminatorValue("Voluntario")
@Table(name = "voluntarios")
public class Voluntario extends Usuario {
	// se crean los atributos de la clase Voluntario
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private Integer runVoluntario;
	private String nombresV;
	private String apellidosV;
	private String fechaDeIngreso;
	private String cargo;
	static Pattern patronFecha = Pattern.compile("\\d{2}/\\d{2}/\\d{4}");
	static Pattern patronHora = Pattern.compile("\\d{2}:\\d{2}");

	// se crea el constructor con todos los atributos de la clase
	public Voluntario() {

	}

	public Voluntario(String fechaDeNacimiento, String tipo, String correo, String password, Integer telefono, String direccion, String comuna, Integer runVoluntario,
			String nombresV, String apellidosV, String fechaDeIngreso, String cargo) {
		super(fechaDeNacimiento, tipo, correo, password, telefono, direccion, comuna);
		this.runVoluntario = runVoluntario;
		this.nombresV = nombresV;
		this.apellidosV = apellidosV;
		this.fechaDeIngreso = fechaDeIngreso;
		this.cargo = cargo;
	}
	// se crean los metodos de acceso y modificadores de yodos los atributos

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getRunVoluntario() {
		return runVoluntario;
	}

	public boolean setRunVoluntario(Integer runVoluntario) {

		if (runVoluntario < 99999999) {
			this.runVoluntario = runVoluntario;
			return true;

		} else {

			return false;
		}
	}

	public String getNombresV() {
		return nombresV;
	}

	public boolean setNombresV(String nombresV) {
		if (nombresV.length() > 4 && nombresV.length() < 31) {
			this.nombresV = nombresV;
			return true; // El nombre se estableció correctamente
		} else {
			return false; // El nombre es inválido
		}
	}

	public String getApellidosV() {
		return apellidosV;
	}

	public boolean setApellidosV(String apellidosV) {
		if (apellidosV.length() > 4 && apellidosV.length() < 31) {
			this.apellidosV = apellidosV;
			return true; // El apellido se estableció correctamente
		} else {
			return false; // El apellido es inválido
		}
	}

	public static Pattern getPatronFecha() {
		return patronFecha;
	}

	public static void setPatronFecha(Pattern patronFecha) {
		Voluntario.patronFecha = patronFecha;
	}

	public static Pattern getPatronHora() {
		return patronHora;
	}

	public static void setPatronHora(Pattern patronHora) {
		Voluntario.patronHora = patronHora;
	}

	public String getFechaDeIngreso() {
		return fechaDeIngreso;
	}

	public boolean setFechaDeIngreso(String fechaDeIngreso) {
		Matcher matcher = patronFecha.matcher(fechaDeIngreso);

		if (!matcher.matches()) {
			return false;
		} else {
			int diaFecha = Integer.parseInt(fechaDeIngreso.substring(0, 2));
			int mesFecha = Integer.parseInt(fechaDeIngreso.substring(3, 5));
			int añoFecha = Integer.parseInt(fechaDeIngreso.substring(6, 10));

			if (diaFecha < 1 || diaFecha > LocalDate.of(añoFecha, mesFecha, 1).lengthOfMonth() || mesFecha < 1
					|| mesFecha > 12) {
				return false;
			}
			this.fechaDeIngreso = fechaDeIngreso;
			return true;
		}

	}
	
	public String getCargo() {
		return cargo;
	}

	public boolean setCargo(String cargo) {
		this.cargo = cargo;
		if (cargo.length() > 5 && cargo.length() < 30) {
			return true;
		} else {
			return false;
		}
	}
	// se crea metodo toString

	public String toString() {
		return super.toString() + "Voluntario [cargo=" + cargo + ", fechaDeIngreso=" + fechaDeIngreso + "]";
	}

	public void analizarUsuario() {
		super.analizarUsuario();
		System.out.println("Tipo de usuario: Voluntario");
		// Mostrar los datos específicos del voluntario
		System.out.println("Run: " + runVoluntario);
		System.out.println("Nombres: " + nombresV);
		System.out.println("Apellidos: " + apellidosV);
		System.out.println("Cargo: " + cargo);
		System.out.println("Fecha de ingreso: " + fechaDeIngreso);
	}
}
