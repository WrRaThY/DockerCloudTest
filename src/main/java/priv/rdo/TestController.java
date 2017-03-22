package priv.rdo;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping(value = "bla", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    String returnBla() {
        return "{\"bla\": \"blaa\"}";
    }
}
