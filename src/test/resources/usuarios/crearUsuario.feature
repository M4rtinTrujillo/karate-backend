Feature: Crear usuario

  Background:
    * url 'https://serverest.dev/usuarios'

  Scenario Outline: Validar creación de usuario en diferentes condiciones
    * def randomEmail = 'qa_' + java.util.UUID.randomUUID() + '@test.com'
    * def fixedEmail = 'qa_tester@test.com'
    * def email = "<email>" == "random" ? randomEmail : fixedEmail
    Given request
      """
      {
        "nome": "<nombre>",
        "email": "#(email)",
        "password": "<password>",
        "administrador": "<admin>"
      }
      """
    When method post
    Then status <status>
    And match response.message == "<mensaje>"

    Examples:
      | nombre           | email   | password | admin | status | mensaje                          |
      | Fulano da Silva  | random  | teste    | true  | 201    | Cadastro realizado com sucesso   |
      | Usuario Duplicado| fixed   | 1234     | true  | 400    | Este email já está sendo usado   |

