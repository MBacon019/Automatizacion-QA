Feature: Gestión de Métodos de Pago 
 
Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
 
Scenario: Crear un método de pago con token automático 
    Given path '/metodo_pago' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "tipo": "Tarjeta", 
      "descripcion": "Pago con tarjeta débito/crédito" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.tipo == 'Tarjeta'