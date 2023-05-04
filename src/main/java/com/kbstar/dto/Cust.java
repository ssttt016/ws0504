package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    @Size(min=4, max=10, message="ID는 최소4자 최대10자입니다.")
    @NotEmpty(message="ID는 필수")
    private String id;
    @Size(min=5, max=10, message="PWD는 최소5자 최대10자입니다.")
    @NotEmpty(message="PWD는 필수")
    private String pwd;
    @NotEmpty(message="NAME는 필수")
    private String name;
}
