package usuarios;

import com.intuit.karate.junit5.Karate;

class RunnerGeneralTest {

    @Karate.Test
    Karate testAll() {
        System.out.println("➡️ Ejecutando todos los features CRUD...");
        return Karate.run(
                "classpath:usuarios/listarUsuarios.feature",
                "classpath:usuarios/crearUsuario.feature",
                "classpath:usuarios/buscarUsuario.feature",
                "classpath:usuarios/actualizarUsuario.feature",
                "classpath:usuarios/eliminarUsuario.feature",
                "classpath:usuarios/validacionesUsuario.feature"
        ).relativeTo(getClass());
    }
}
