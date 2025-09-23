Feature: Eliminar usuario

  Scenario: Eliminar un usuario existente
    * def result = call read('classpath:usuarios/crearUsuario.feature@crearPositivo')
    * def userId = result.userId
    Given url 'https://serverest.dev/usuarios/' + userId
    When method delete
    Then status 200
    And match response.message == "Registro excluído com sucesso"


  Scenario: eliminar un usuario inexistente
    * def userId = '2345678901234567'
    Given url 'https://serverest.dev/usuarios/' + userId
    When method delete
    Then status 200
    And match response.message == "Nenhum registro excluído"
    * print 'No se pudo eliminar, usuario inexistente con ID:', userId
