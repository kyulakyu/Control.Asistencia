package model.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "administrativos")
@DiscriminatorValue("Administrativo")
public class Administrativo extends Usuario {
	// se crean los atributos de la clase Adiministrativo
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int run;
	private String nombres;
	private String apellidos;
	private String clienteAdministrativo;

	// se crea el constructor con todos los atributos de la clase
	public Administrativo() {

	}

	public Administrativo(String fechaDeNacimiento, String tipo, String correo, String password, Integer telefono, String direccion, String comuna,
			int run, String nombres, String apellidos, String clienteAdministrativo) {
		super(fechaDeNacimiento, tipo, correo, password, telefono, direccion, comuna);
		this.run = run;
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.clienteAdministrativo = clienteAdministrativo;
	}

	// se crean los metodos de acceso y modificadores de yodos los atributos
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRun() {
		return run;
	}

	public boolean setRun(int run) {

		if (run < 99999999) {
			this.run = run;
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

	public String getClienteAdministrativo() {
		return clienteAdministrativo;
	}

	public void setClienteAdministrativo(String clienteAdministrativo) {
		this.clienteAdministrativo = clienteAdministrativo;
	}

	// se crea metodo toString

	public void analizarUsuario() {
		super.analizarUsuario();

		System.out.println("Tipo de usuario: Administrativo");
		// Mostrar los datos específicos del administrativo
		System.out.println("Cliente: " + clienteAdministrativo);
	}
}