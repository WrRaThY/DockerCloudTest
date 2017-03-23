package priv.rdo;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {
    private final AnimalFinder animalFinder;

    public TestController(AnimalFinder animalFinder) {
        this.animalFinder = animalFinder;
    }

    @GetMapping(value = "bla", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    String returnBla() {
        return "{\"bla\": \"blaa\"}";
    }

    @GetMapping("animals")
    List<AnimalResource> findAllAnimals() {
        return animalFinder.findAllAnimals();
    }
}
