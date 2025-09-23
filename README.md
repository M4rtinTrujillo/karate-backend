 Proyecto de Pruebas con Karate - Backend API (Serverest)

Este proyecto implementa pruebas automatizadas con **Karate DSL** para validar la API pública de [Serverest](https://serverest.dev).
Se cubren operaciones CRUD sobre usuarios, con escenarios positivos y negativos.


Estructura del Proyecto

karate-backend/
├── pom.xml
├── src/
└── target/test-classes/
└── usuarios/
├── crearUsuario.feature
├── buscarUsuario.feature
├── eliminarUsuario.feature
├── listarUsuarios.feature
└── actualizarUsuario.feature
```
---

Requisitos

- Java 8+ (`java -version`)
- Maven (`mvn -version`)
-  Editor:  IntelliJ IDEA


 Ejecución de pruebas

 mvn test -Dtest=usuarios.RunnerGeneralTest
```
