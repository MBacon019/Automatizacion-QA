package karate;

import com.intuit.karate.junit5.Karate;

class AllTests {
    
    @Karate.Test
    Karate testAll() {
        // Al no poner un nombre específico, Karate busca todos los .feature 
        // en este paquete y subcarpetas
        return Karate.run().relativeTo(getClass());
    }
}