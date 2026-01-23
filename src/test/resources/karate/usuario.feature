Feature: Gestión de Usuarios 

Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
    # Generamos un número aleatorio para el correo
    * def emailDinamico = 'test' + java.util.UUID.randomUUID() + '@example.com'

Scenario: Crear un nuevo usuario con token automático 
    Given path '/usuario' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "nombre": "Mateo", 
      "apellido": "Alba", 
      "correo": "#(emailDinamico)", 
      "telefono": "987654321", 
      "direccion": "Calle Falsa 123", 
      "contrasena": "Password1A", 
      "rol_id": "poner-un-uuid-de-rol-existente" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.nombre == 'Mateo'