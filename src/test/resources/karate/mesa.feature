Feature: Gestión de Mesas

Background:
    * url 'http://localhost:3000'
    # Reutilizamos la lógica de login para obtener el token
    * def login = call read('auth.feature')
    * def authToken = login.token

Scenario: Crear una mesa con token automático 
    # 1. Llamamos a sucursal para obtener un ID dinámico
    * def sucursalRes = call read('sucursal.feature')
    * def idSucursalReal = sucursalRes.response.id_sucursal

    Given path '/mesas' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "numero": 12, 
      "capacidad": 4, 
      "estado": "disponible", 
      "id_sucursal": "#(idSucursalReal)" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.numero == 12