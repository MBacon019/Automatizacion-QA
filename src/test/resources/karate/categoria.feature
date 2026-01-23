Feature: Gestión de Categorías 
 
Background: 
    * url 'http://localhost:3000' 
     # 1. Llamamos al archivo de login 
     * def login = call read('auth.feature') 
     # 2. Guardamos el token que nos devolvió 
   * def authToken = login.token 
 
Scenario: Crear una nueva categoría con token automático 
     Given path '/categorias' 
     # 3. Usamos el token en el header 
     And header Authorization = 'Bearer ' + authToken 
     And request  
     """ 
     { 
      "nombre": "Comida Rapida", 
       "descripcion": "Disfruta de todo tipo de comida rapida" 
     } 
   """ 
     When method post 
     Then status 201 
     And match response.nombre == "Comida Rapida"