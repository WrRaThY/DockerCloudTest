package priv.rdo;

import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
class AnimalFinder {
    List<AnimalResource> findAllAnimals() {
        PersonResource person = PersonResource.builder().name("Stefan").surname("Wawryszko").motto("nie wiem, to sie wypowiem").build();
        return Collections.singletonList(AnimalResource.builder().name("Mieszko").age(4).owner(person).build());
    }
}
