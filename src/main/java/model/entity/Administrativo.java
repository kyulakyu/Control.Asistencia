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
public class Administrativo extends Usuario{
	//se crean los atributos de la clase Adiministrativo
	@Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String area;
	@Column(nullable = true)
	private String experienciaPrevia;
	 //se crea el constructor con todos los atributos de la clase
	public Administrativo() {
		
	}
	
	 public Administrativo(String nombre, String fechaDeNacimiento, int run, String tipo, String area, String experienciaPrevia) {
	        super(nombre, fechaDeNacimiento, run, tipo);
	        this.area = area;
	        this.experienciaPrevia = experienciaPrevia;
	    }
	//se crean los metodos de acceso y modificadores de yodos los atributos
	public String getArea() {
		return area;
	}

	public boolean setArea(String area) {
		this.area = area;
		if (area.length() > 5 && area.length() < 30) {
	        return true; 
	    } else {
	        return false; 
	    }
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExperienciaPrevia() {
		return experienciaPrevia;
	}

	public boolean setExperienciaPrevia(String experienciaPrevia) {
		this.experienciaPrevia = experienciaPrevia;
		if (experienciaPrevia.length() < 100) {
	    	this.experienciaPrevia = experienciaPrevia;
	        return true; 
	    } else {
	        return false; 
	    }
	}

	//se crea metodo toString

	
	
	public void analizarUsuario() {
		super.analizarUsuario();
       
        System.out.println("Tipo de usuario: Administrativo");
        // Mostrar los datos específicos del administrativo
        System.out.println("Area: " + area);
        System.out.println("Experiencia Previa: " + experienciaPrevia);
    }
	
	
}