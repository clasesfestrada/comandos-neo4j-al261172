// Operaciones CRUD (Create, Read, Update, Delete) en Neo4j

// ------------------------------------- Crear un nuevo estudiante -------------------------------------
CREATE (:Estudiante {
    id: 'E999',
    nombre: 'Nuevo Estudiante',
    carrera: 'Ingeniería',
    semestre: toInteger(9)
});

// ------------------------------------- Crear una nueva inscripción -------------------------------------
CREATE (e:Estudiante {id: 'E999'}) - [:INSCRITO_EN {calificacion: toFloat(9.99)}] -> (m:Materia {id: 'M001'});

// ------------------------------------- Leer Estudiantes -------------------------------------
MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

// ------------------------------------- COnsultar relaciones -------------------------------------

MATCH (e_o:Estudiante) -[:AMIGO_DE]-> (e_d:Estudiante)
RETURN e_o.nombre AS estudiante, e_d.nombre AS amigo;

