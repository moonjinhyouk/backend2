package com.example.board.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Data
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bcode;

    private String subject;
    private String content;
    private String writer;
    private LocalDate regdate = LocalDate.now();
}
