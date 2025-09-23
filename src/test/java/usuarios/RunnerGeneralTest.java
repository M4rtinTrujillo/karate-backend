package usuarios;

import com.intuit.karate.junit5.Karate;

class RunnerGeneralTest {

    @Karate.Test
    Karate testAll() {
        System.out.println("👉 Ejecutando todos los features CRUD...");
        return Karate.run(
                "listarUsuarios",
                "crearUsuario",
                "buscarUsuario",
                "actualizarUsuario",
                "eliminarUsuario"
        ).relativeTo(getClass());
    }
}

