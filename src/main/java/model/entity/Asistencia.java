package model.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "asistencia")
public class Asistencia {
	// se crean los atributos de la clase Asistencia
	@Id
	@Column(name = "id")
	private int idAsistencia;
	private int voluntarioId;
	private String fechaAsistencia;
	private String detalle;

	// se crea el constructor con todos los atributos de la clase
	public Asistencia() {

	}

	public Asistencia(int idAsistencia, int voluntarioId, String fechaAsistencia, String detalle) {
		super();
		this.idAsistencia = idAsistencia;
		this.voluntarioId = voluntarioId;
		this.fechaAsistencia = fechaAsistencia;
        this.detalle = detalle;

	}
	// se crean los metodos de acceso y modificadores de yodos los atributos
	public int getIdAsistencia() {
		return idAsistencia;
	}

	public boolean setIdAsistencia(int idAsistencia) {
		String idAsistenciaString = Integer.toString(idAsistencia);

		if (idAsistenciaString != null && !idAsistenciaString.isEmpty()) {
			try {
				int id = Integer.parseInt(idAsistenciaString);
				this.idAsistencia = id;
				return true; // Indicar que el valor se estableció correctamente
			} catch (NumberFormatException e) {
				return false;
			}
		} else {
			return false;
		}
	}

	public int getVoluntarioId() {
		return voluntarioId;
	}

	public boolean setVoluntarioId(int voluntarioId) {
		String voluntarioIdString = Integer.toString(voluntarioId);

		if (voluntarioIdString != null && !voluntarioIdString.isEmpty()) {
			try {
				int id = Integer.parseInt(voluntarioIdString);
				this.voluntarioId = id;
				return true; // Indicar que el valor se estableció correctamente
			} catch (NumberFormatException e) {
				return false;
			}
		} else {
			return false;
		}
	}

	public String getFechaAsistencia() {
		return fechaAsistencia;
	}

	public boolean setFechaAsistencia(String fechaAsistencia) {
		if (fechaAsistencia == null) {
			return false; // La fecha es nula, formato incorrecto
		}
		String formatoFecha = "dd/MM/yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(formatoFecha);
		sdf.setLenient(false); // Evita la flexibilidad en el análisis de fechas
		try {
			sdf.parse(fechaAsistencia);
			this.fechaAsistencia = fechaAsistencia;
			return true; // La fecha tiene el formato correcto y fue establecida correctamente
		} catch (ParseException e) {
			return false; // La fecha no tiene el formato correcto
		}
	}

	
    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }
}