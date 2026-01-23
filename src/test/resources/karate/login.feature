Feature: Proceso de Autenticación 
 
  Scenario: Login exitoso 
    Given url 'http://localhost:3000/auth/login' 
    And request 
    """ 
    { 
      "correo": "mateoalba1234@gmail.com", 
      "contrasena": "Mateo1752" 
    } 
    """ 
    When method post 
    Then status 201 
    # Extraemos el token de la respuesta para que otros archivos lo usen 
    * def token = response.access_token 