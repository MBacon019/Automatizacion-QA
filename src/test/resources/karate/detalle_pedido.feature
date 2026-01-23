Feature: Gestión de Detalle de Pedidos

Background:
    * url baseUrl
    * def login = call read('auth.feature')
    * def authToken = login.token
    
    # Obtenemos un Plato real
    * def platoRes = call read('plato.feature')
    * def idPlatoReal = platoRes.response.id_plato
    
    # Obtenemos un Pedido real
    * def pedidoRes = call read('pedido.feature')
    * def idPedidoReal = pedidoRes.response.id_pedido

Scenario: Crear un detalle de pedido con token automático
    Given path '/detalle_pedido'
    And header Authorization = 'Bearer ' + authToken
    And request
    """
    {
      "id_pedido": "#(idPedidoReal)",
      "id_plato": "#(idPlatoReal)",
      "cantidad": 2,
      "subtotal": 36000
    }
    """
    When method post
    Then status 201
    And match response.cantidad == 2