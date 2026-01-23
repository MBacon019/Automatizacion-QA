Feature: Gestión de Sucursales 
 
Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
 
Scenario: Crear una sucursal con token automático 
    Given path '/sucursal' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "nombre": "Sucursal Centro", 
      "direccion": "Av. Principal 100", 
      "telefono": "321654987" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.nombre == 'Sucursal Centro'