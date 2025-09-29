Feature: Buscar usuario por ID

  Background:
    * url 'https://serverest.dev/usuarios'
    * def randomEmail = 'qa_' + java.util.UUID.randomUUID() + '@test.com'
    Given request
      """
      {
        "nome": "Usuario QA",
        "email": "#(randomEmail)",
        "password": "12345",
        "administrador": "true"
      }
      """
    When method post
    Then status 201
    * def createdUserId = response._id

  Scenario Outline: Validar búsqueda de usuario
    Given path <id>
    When method get
    Then status <status>
    And <validacion>

    Examples:
      | id              | status | validacion                                    |
      | createdUserId   | 200    | match response._id == createdUserId           |
      | 'ABCD1234EFGH5678' | 400 | match response.message == 'Usuário não encontrado' |
