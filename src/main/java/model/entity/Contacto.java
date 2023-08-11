package model.entity;

import javax.persistence.*;

@Entity
@Table(name = "Contacto")
public class Contacto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "comentario")
    private String comentario;


    // Constructores, getters y setters

    public Contacto() {
    }

    public Contacto(String nombre, String email, String comentario) {
        this.nombre = nombre;
        this.email = email;
        this.comentario = comentario;
    }

    // Getter y Setter para id

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    }