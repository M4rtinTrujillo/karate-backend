# Proyecto de Pruebas con Karate - Backend API

Este proyecto contiene pruebas automatizadas hechas con **Karate DSL** para validar la API pública de [Serverest](https://serverest.dev).
El enfoque principal está en probar el módulo de usuarios, incluyendo casos positivos y negativos (crear, buscar, eliminar, listar y actualizar).

---

## Estructura del proyecto

```
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

## Requisitos

- Tener instalado **Java 8 o superior** (`java -version`)
- Tener **Maven** configurado (`mvn -version`)
- Cualquier editor de código (VS Code o IntelliJ sirven bien)

---

## Cómo ejecutar las pruebas

- Para correr todo el set de pruebas:

mvn test -Dtest=usuarios.RunnerGeneralTest

# Ver Reporte

open target/karate-reports/karate-summary.html



## Reportes

Los reportes se generan automáticamente en:

target/karate-reports/karate-summary.html

Ese archivo se puede abrir directamente en el navegador para revisar los resultados de la ejecución.

---

## Features incluidos

- **crearUsuario.feature**
    - Caso positivo: creación de usuario con email único → espera `201`.
    - Caso negativo: creación de usuario con email repetido → espera `400`.

- **buscarUsuario.feature**
    - Caso positivo: busca un usuario recién creado → espera `200`.
    - Caso negativo: busca un ID inexistente → espera `400`.

- **eliminarUsuario.feature**
    - Caso positivo: elimina un usuario válido → espera `200`.
    - Caso negativo: intenta eliminar un ID inexistente → devuelve mensaje de que no se eliminó nada.

- **listarUsuarios.feature**
    - Caso positivo: lista todos los usuarios → espera `200`.
    - Caso negativo: se prueba con rutas inválidas para validar errores (`404` o `405`).

- **actualizarUsuario.feature**
    - Escenarios para actualizar datos de un usuario. Incluye validaciones de éxito y de error.

---

## Notas

- Se utilizan **tags** para organizar los escenarios (ej: `@crearPositivo`, `@crearNegativo`).
- Algunos features llaman a otros para no repetir lógica (ej: crear usuario antes de buscarlo).


---

Autor: **Juan Martín Trujillo López**
Proyecto de pruebas automatizadas con Karate para Serverest API.
