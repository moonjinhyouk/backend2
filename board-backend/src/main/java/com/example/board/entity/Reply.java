package com.example.board.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Data
public class Reply {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rcode;

    private Integer bcode;
    private String reply;
    private String writer;
    private LocalDate regdate = LocalDate.now();
}
