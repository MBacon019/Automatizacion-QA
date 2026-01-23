Feature: Autenticación para otros tests 
 
Scenario: Login y obtener token 
    Given url 'http://localhost:3000/auth/login' 
    And request { "correo": "mateoalba1234@gmail.com", "contrasena": "Mateo1752" } 
    When method post 
    Then status 201 
    * def token = response.access_token