package test.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Students")

public class Students implements Serializable{
	@Id
	@Column(name = "masv")
	Integer masv;
	
	@Column(name = "name")
	String name;
	
	@Column(name = "mark")
	Float mark;
	
	@Column(name = "major")
	String major;
}
