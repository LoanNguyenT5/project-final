package com.mycompany.spring_mvc_project_final.entities;

import com.mysql.cj.jdbc.Blob;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Table(name = "student")
public class StudentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private int age;
    @Lob
    private byte[] photo;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
}
