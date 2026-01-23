package test;

import com.intuit.karate.junit5.Karate;

class KarateTests {

    @Karate.Test
    Karate runAll() {
        return Karate.run("classpath:karate");
    }
}
