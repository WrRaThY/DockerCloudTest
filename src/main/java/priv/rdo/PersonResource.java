package priv.rdo;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
class PersonResource {
    private String name;
    private String surname;
    private String motto;
}
