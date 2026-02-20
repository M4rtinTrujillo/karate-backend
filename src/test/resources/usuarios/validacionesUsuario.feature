Feature: Validar creación de usuario con campos obligatorios faltantes

  Background:
    * url 'https://serverest.dev/usuarios'

  Scenario Outline: Intentar crear usuario con campos faltantes
    Given request
      """
      {
        "nome": <nombre>,
        "email": <email>,
        "password": <password>,
        "administrador": "true"
      }
      """
    When method post
    Then status 400
    And match response == <mensaje>

    Examples:
      | nombre              | email                 | password | mensaje                                                |
      | null                | "qa_test1@test.com"   | "1234"   | { nome: "nome deve ser uma string" }                   |
      | "Usuario sin email1" | null                  | "1234"   | { email: "email deve ser uma string" }                 |
      | "Usuario sin  pass"  | "qa_test2@test.com"   | null     | { password: "password deve ser uma string" }           |
