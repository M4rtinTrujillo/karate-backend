Feature: Buscar usuario por ID

  Scenario: Buscar un usuario existente
    * def result = call read('classpath:usuarios/crearUsuario.feature@crearPositivo')
    * def userId = result.userId
    Given url 'https://serverest.dev/usuarios/' + userId
    When method get
    Then status 200
    And match response._id == userId





  Scenario: Buscar un usuario inexistente

    * def userId = 1234567891234560
    Given url 'https://serverest.dev/usuarios/' + userId
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'