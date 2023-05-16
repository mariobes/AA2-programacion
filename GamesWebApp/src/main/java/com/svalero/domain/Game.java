package com.svalero.domain;

import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Game {

    private int id;
    @NonNull
    private String name;
    @NonNull
    private String developer;
    @NonNull
    private char game_18;
    @NonNull
    private LocalDate release_date;

}
