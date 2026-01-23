Feature: Gestión de Reservas 

Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 

Scenario: Crear una reserva con token automático 
    # 1. Llamar a mesa para tener un ID real y que el servidor no lo rechace
    * def mesaRes = call read('mesa.feature')
    * def idMesaReal = mesaRes.response.id_mesa

    Given path '/reserva' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "id_usuario": "00000000-0000-0000-0000-000000000000", 
      "id_mesa": "#(idMesaReal)", 
      "numero_personas": 4, 
      "estado": "confirmada" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.estado == 'confirmada'