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
	//se crean los atributos de la clase Cliente
@Id
@Column(name = "id")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private Integer rut;
private String nombres;
private String apellidos;
private Integer telefono;
private String afp;
private String sistemaDeSalud;
private String direccion;
private String comuna;
@Column(nullable = true)
private Integer edad;


public Cliente() {

}
//se crea el constructor con todos los atributos de la clase
public Cliente(String nombre, String fechaDeNacimiento, Integer run, String tipo, Integer rut, String nombres, String apellidos, Integer telefono, String afp, String sistemaDeSalud,
		String direccion, String comuna, Integer edad) {
	super(nombre, fechaDeNacimiento, run, tipo);
	this.rut = rut;
	this.nombres = nombres;
	this.apellidos = apellidos;
	this.telefono = telefono;
	this.afp = afp;
	this.sistemaDeSalud = sistemaDeSalud;
	this.direccion = direccion;
	this.comuna = comuna;
	this.edad = edad;
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
public void setTelefono(Integer telefono) {
	this.telefono = telefono;
}
public void setRut(int rut) {
    this.rut = rut;
}


public String getNombres() {
	return nombres;
}

public boolean setNombres(String nombres) {
    if (nombres.length()>4 && nombres.length()<31) {
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
    if (apellidos.length()>4 && apellidos.length()<31) {
    	this.apellidos = apellidos;
        return true; // El apellido se estableció correctamente
    } else {
        return false; // El apellido es inválido
    }
}
public Integer getTelefono() {
	return telefono;
}
public void setTelefono(int telefono) {
    this.telefono = telefono;
}


public String getAfp() {
	return afp;
}

public boolean setAfp(String afp) {
    if (afp.length()>3 && afp.length()<31) {
    	this.afp = afp;
        return true; // La afp se estableció correctamente
    } else {
        return false; // La afp es inválida
    }
}
public String getSistemaDeSalud() {
	return sistemaDeSalud;
}

public boolean setSistemaDeSalud(String sistemaDeSalud) {
	if (sistemaDeSalud.equals("1") || sistemaDeSalud.equals("2")) {
		String sSalud;
		sSalud = obtenerSistemaSalud(sistemaDeSalud);
		this.sistemaDeSalud = sSalud;
        return true; // La afp se estableció correctamente
    } else {
        return false; // La afp es inválida
    }
}


public String getDireccion() {
	return direccion;
}

public boolean setDireccion(String direccion) {
	if (direccion.length()<71) {
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
	if (comuna.length()<51) {
		this.comuna = comuna;
        return true; // La comuna se estableció correctamente
    } else {
        return false; // La comuna es inválida
    }
}
public Integer getEdad() {
	return edad;
}

public void setEdad(Integer edad) {
    this.edad = edad;
}


//se crea metodo toString

public String toString() {
	return super.toString() + " Cliente [rut=" + rut + ", nombres=" + nombres + ", apellidos=" + apellidos + ", telefono=" + telefono
			+ ", afp=" + afp + ", sistemaDeSalud=" + sistemaDeSalud + ", direccion=" + direccion + ", comuna=" + comuna
			+ ", edad=" + edad + "]";
}

public String obtenerNombre() {
    return nombres + " " + apellidos;
}

//creando metodo para obtener el sistema de salud
public String obtenerSistemaSalud(String sistemaDeSalud) {
    if (sistemaDeSalud.equals("1")) {
    	String resultado = "Fonasa";
        return resultado ;
        
    } else if (sistemaDeSalud.equals("2")) {
    	String resultado = "Isapre";
        return resultado;
    } else {
    	String resultado="Desconocido";
        return resultado;
    }
}

public void analizarUsuario() {
    super.analizarUsuario();
    System.out.println("Tipo de usuario: Cliente");
    // Mostrar los datos específicos del cliente
    System.out.println("RUT: " + rut);
    System.out.println("Nombres: " + nombres);
    System.out.println("Apellidos: " + apellidos);
    System.out.println("Teléfono: " + telefono);
    System.out.println("AFP: " + afp);
    System.out.println("Sistema de salud: " + sistemaDeSalud);
    System.out.println("Dirección: " + direccion);
    System.out.println("Comuna: " + comuna);
    System.out.println("Edad: " + edad);
}
	
}