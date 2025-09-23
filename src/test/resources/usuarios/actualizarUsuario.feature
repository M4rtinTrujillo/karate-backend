Feature: Actualizar usuario

  Background:
    * url 'https://serverest.dev'

  Scenario Outline: Actualizar un usuario existente - OK
    * print 'Escenario ejecutado - Actualizar usuario'
    Given path 'usuarios', userId
    And request { "nome": "Juan QA Actualizadooo", "email": "juanMadsfrioJBAjioajio.qa@test.com", "password": "5678", "administrador": "false" }
    When method put
    Then status 200
    And match response.message == "Registro alterado com sucesso"

    Examples:
      | userId           |
      | 0uxuPY0cbmQhpEz1|

  Scenario Outline: Actualizar un usuario existente - NO OK
    * print 'Escenario ejecutado - Actualizar usuario'
    Given path 'usuarios', userId
    And request { "nome": "Juan QA Actualizado", "email": "juanMarioJBAjioajio.qa@test.com", "password": "5678", "administrador": "false" }
    When method put
    Then status 400
    And match response.message == "Este email já está sendo usado"

    Examples:
      | userId               |
      | PnbzVtL4eS0xCZFG1123 |

