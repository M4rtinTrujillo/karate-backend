Feature: Eliminar usuario

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

  Scenario Outline: Validar eliminación de usuario
    Given path <id>
    When method delete
    Then status 200
    And match response.message == <mensaje>

    Examples:
      | id             | mensaje                          |
      | createdUserId  | "Registro excluído com sucesso"  |
      | '2345678901234567' | "Nenhum registro excluído"   |
