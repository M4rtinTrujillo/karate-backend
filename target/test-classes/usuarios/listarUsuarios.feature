Feature: Listar usuarios

  Scenario: Obtener todos los usuarios
    * print 'Escenario ejecutado'
    Given url 'https://serverest.dev/usuarios'
    When method get
    Then status 200

  Scenario: Intentar obtener usuarios con ruta inválida usando variable
    * def invalidPath = 'usuarioszxc'
    Given url 'https://serverest.dev/' + invalidPath
    When method get
    Then status 405
    And match response.message == "Não é possível realizar GET em /" + invalidPath + ". Acesse https://serverest.dev para ver as rotas disponíveis e como utilizá-las."
    * print 'No se pudo listar usuarios, endpoint inválido:', invalidPath

