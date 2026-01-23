Feature: Gestión de Facturas 

Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
    # Obtenemos un Pedido y un Método de Pago reales para que la BD no falle
    * def pedidoRes = call read('pedido.feature')
    * def metodoRes = call read('metodo_pago.feature')
    
    * def idPedidoReal = pedidoRes.response.id_pedido
    * def idMetodoReal = metodoRes.response.id_metodo

Scenario: Crear una factura con token automático 
    Given path '/factura' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "id_pedido": "#(idPedidoReal)", 
      "id_metodo": "#(idMetodoReal)", 
      "total": 36000 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.total == 36000