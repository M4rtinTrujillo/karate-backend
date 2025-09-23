Feature: Crear usuario
  @crearPositivo
  Scenario: Crear usuario con email único
    * def randomEmail = 'qa_' + java.util.UUID.randomUUID() + '@test.com'
    Given url 'https://serverest.dev/usuarios'
    And request
    """
    {
      "nome": "Fulano da Silva",
      "email": "#(randomEmail)",
      "password": "teste",
      "administrador": "true"
    }
    """
    When method post
    Then status 201
    * def userId = response._id
    * karate.set('userId', userId)
    * print 'Usuario creado con ID:', userId


  @crearNegativo
  Scenario: Intentar crear usuario con email duplicado
    * def fixedEmail = 'qa_tester@test.com'
    Given url 'https://serverest.dev/usuarios'
    And request { "nome": "Usuario Duplicado", "email": "#(fixedEmail)", "password": "1234", "administrador": "true" }
    When method post
    Then status 400
    And match response.message == 'Este email já está sendo usado'
    * print 'No se pudo crear usuario, email ya registrado:', fixedEmail


