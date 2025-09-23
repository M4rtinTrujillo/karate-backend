Feature: Flujo completo de usuario

  Scenario: Crear, buscar y eliminar usuario
    # 1. Crear usuario
    * def result = call read('crearUsuario.feature')
    * def userId = result.userId
    * print 'UserId capturado:', userId

    # 2. Buscar usuario
    * call read('buscarUsuario.feature') { userId: userId }

    # 3. Eliminar usuario
    * call read('eliminarUsuario.feature') { userId: userId }