Feature: Gestión de Pedidos 
 
Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
 
Scenario: Crear un pedido con token automático 
    Given path '/pedido' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "tipo": "para llevar", 
      "id_usuario": "00000000-0000-0000-0000-000000000000", 
      "id_mesa": null, 
      "total": 25000, 
      "estado": "pendiente" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.estado == 'pendiente'