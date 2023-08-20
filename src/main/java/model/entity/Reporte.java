package model.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reporte")
public class Reporte {
	// se crean los atributos de la clase Reporte
	@Id
	@Column(name = "id")
	private int idReporte;
	private int voluntarioId;
	private String fechaReporte;
	private String detalle;

	// se crea el constructor con todos los atributos de la clase
	public Reporte() {

	}

	public Reporte(int idReporte, int voluntarioId, String fechaReporte, String detalle) {
		super();
		this.idReporte = idReporte;
		this.voluntarioId = voluntarioId;
		this.fechaReporte = fechaReporte;
        this.detalle = detalle;

	}
	// se crean los metodos de acceso y modificadores de yodos los atributos
	public int getIdReporte() {
		return idReporte;
	}

	public boolean setIdReporte(int idReporte) {
		String idReporteString = Integer.toString(idReporte);

		if (idReporteString != null && !idReporteString.isEmpty()) {
			try {
				int id = Integer.parseInt(idReporteString);
				this.idReporte = id;
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

	public String getFechaReporte() {
		return fechaReporte;
	}

	public boolean setFechaReporte(String fechaReporte) {
		if (fechaReporte == null) {
			return false; // La fecha es nula, formato incorrecto
		}
		String formatoFecha = "dd/MM/yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(formatoFecha);
		sdf.setLenient(false); // Evita la flexibilidad en el análisis de fechas
		try {
			sdf.parse(fechaReporte);
			this.fechaReporte = fechaReporte;
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