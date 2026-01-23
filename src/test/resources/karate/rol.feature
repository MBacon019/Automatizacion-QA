Feature: Gestión de Roles 
 
Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
 
Scenario: Crear un rol con token automático 
    Given path '/rol' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "nombre": "Administrador", 
      "descripcion": "Acceso completo" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.nombre == 'Administrador'