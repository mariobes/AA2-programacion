package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Purchase {

    private int id;
    @NonNull
    private float price;
    @NonNull
    private String phone;
    @NonNull
    private String payment_method;

    private Game game;

}
