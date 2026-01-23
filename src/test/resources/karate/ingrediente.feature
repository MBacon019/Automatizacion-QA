Feature: Gestión de Ingredientes 
 
Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
 
Scenario: Crear un ingrediente con token automático 
    Given path '/ingrediente' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "nombre": "Tomate", 
      "unidad_medida": "kg", 
      "stock": 50 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.nombre == 'Tomate'