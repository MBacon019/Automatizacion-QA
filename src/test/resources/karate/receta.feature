Feature: Gestión de Recetas 

Background: 
    * url 'http://localhost:3000' 
    * def login = call read('auth.feature') 
    * def authToken = login.token 

Scenario: Crear una receta con token automático 
    * def platoRes = call read('plato.feature')
    * def ingredienteRes = call read('ingrediente.feature')
    
    # CORRECCIÓN: Se debe usar .response para acceder a los datos devueltos
    * def idPlatoReal = platoRes.response.id_plato
    * def idIngredienteReal = ingredienteRes.response.id_ingrediente

    Given path '/recetas' 
    And header Authorization = 'Bearer ' + authToken 
    And request 
    """ 
    { 
      "id_plato": "#(idPlatoReal)", 
      "id_ingrediente": "#(idIngredienteReal)", 
      "cantidad": 2 
    } 
    """ 
    When method post 
    Then status 201
    And match response.cantidad == 2