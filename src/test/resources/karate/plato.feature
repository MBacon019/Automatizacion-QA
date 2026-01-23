Feature: Gestión de Platos 
 
Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 
 
Scenario: Crear un plato con token automático 
    # 1. Creamos una categoría real primero
    * def categoriaRes = call read('categoria.feature')
    * def idCatReal = categoriaRes.response.id_categoria

    Given path '/platos' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "nombre": "Hamburguesa", 
      "descripcion": "Hamburguesa doble con queso", 
      "precio": 18000, 
      "disponible": true, 
      "id_categoria": "#(idCatReal)" 
    } 
    """ 
    When method post 
    Then status 201 
    And match response.nombre == 'Hamburguesa'