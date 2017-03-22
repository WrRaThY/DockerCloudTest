package priv.rdo;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
class AnimalResource {
    private String name;
    private int age;
    private PersonResource owner;
}
