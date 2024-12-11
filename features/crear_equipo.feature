Feature: Crear un equipo de ciclismo
    Como usuario
    quiero poder agregar ciclistas de diferentes tipos (velocistas, montañistas y contrarrelojistas) a mi equipo
    para que se ajusten a las necesidades de cada compentencia.

    Como usuario
    quiero recibir un mensaje de error claro si intento agregar un ciclista con un tipo desconocido
    para poder corregir el error rápidamente.

    Como usuario 
    quiero poder verificar que mi equipo tiene la cantidad correcta de ciclistas después de agregarlos

    Como usuario 
    quiero poder verificar que cada ciclista agregado tiene el tipo correcto y esta correctamente registrado en el equipo.

Scenario: Agregar diferentes tipos de ciclistas al equipo
    Given un equipo vacio de ciclistas llamado "Team Bora"
    When yo agrego los siguientes ciclistas al equipo
    | tipo             | nombre         | edad  | nacionalidad | atributo especifico | 
    | Velocista        | Peter Sagan    | 37    | Irlanda      | 65                  |
    | Montanista       | Nairo Quintana | 35    | Colombia     | Alta                |
    | Contrarrelojista | Tony Martin    | 30    | UK           | 40                  |
    Then el equipo debe tener 3 ciclistas
    And el equipo debe tener un ciclista llamado "Peter Sagan" con el tipo "Velocista"
    And el equipo debe tener un ciclista llamado "Nairo Quintana" con el tipo "Montanista"
    And el equipo debe tener un ciclista llamado "Tony Martin" con el tipo "Contrarrelojista"

@escenarioDesconocido
Scenario: Agregar un ciclista con un tipo desconocido
    Given un equipo vacio de ciclistas llamado "Team Bora"
    When yo intento agregar un ciclista con un tipo desconocido
    | tipo             | nombre            | edad  | nacionalidad | atributo especifico | 
    | Desconocido      | Rigoberto Uran    | 42    | Colombia     | 70                  |
    Then debe ocurrir un error con el mensaje "Tipo de ciclista desconocido"
