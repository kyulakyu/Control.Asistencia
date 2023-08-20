package model.entity;

import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "voluntarios")
public class Voluntario extends Usuario {
	// se crean los atributos de la clase Voluntario
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int runVoluntario;
	private String nombres;
	private String apellidos;
	private String cargo;
	private String fechaDeIngreso;
	static Pattern patronFecha = Pattern.compile("\\d{2}/\\d{2}/\\d{4}");
	static Pattern patronHora = Pattern.compile("\\d{2}:\\d{2}");

	// se crea el constructor con todos los atributos de la clase
	public Voluntario() {

	}

	public Voluntario(String fechaDeNacimiento, String tipo, Integer telefono, String direccion, String comuna, int runVoluntario,
			String nombres, String apellidos, String cargo, String fechaDeIngreso) {
		super(fechaDeNacimiento, tipo, telefono, direccion, comuna);
		this.runVoluntario = runVoluntario;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.cargo = cargo;
		this.fechaDeIngreso = fechaDeIngreso;
	}
	// se crean los metodos de acceso y modificadores de yodos los atributos

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRunVoluntario() {
		return runVoluntario;
	}

	public boolean setRunVoluntario(int runVoluntario) {

		if (runVoluntario < 99999999) {
			this.runVoluntario = runVoluntario;
			return true;

		} else {

			return false;
		}
	}

	public String getNombres() {
		return nombres;
	}

	public boolean setNombres(String nombres) {
		if (nombres.length() > 4 && nombres.length() < 31) {
			this.nombres = nombres;
			return true; // El nombre se estableció correctamente
		} else {
			return false; // El nombre es inválido
		}
	}

	public String getApellidos() {
		return apellidos;
	}

	public boolean setApellidos(String apellidos) {
		if (apellidos.length() > 4 && apellidos.length() < 31) {
			this.apellidos = apellidos;
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
	// se crea metodo toString

	public String toString() {
		return super.toString() + "Voluntario [cargo=" + cargo + ", fechaDeIngreso=" + fechaDeIngreso + "]";
	}

	public void analizarUsuario() {
		super.analizarUsuario();
		System.out.println("Tipo de usuario: Voluntario");
		// Mostrar los datos específicos del voluntario
		System.out.println("runVoluntario: " + runVoluntario);
		System.out.println("Nombres: " + nombres);
		System.out.println("Apellidos: " + apellidos);
		System.out.println("Cargo: " + cargo);
		System.out.println("Fecha de ingreso: " + fechaDeIngreso);
	}
}
