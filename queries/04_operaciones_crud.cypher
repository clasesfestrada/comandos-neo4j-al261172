// Operaciones CRUD (Create, Read, Update, Delete) en Neo4j

///////////////////////////////////////    CREATE    /////////////////////////////////////////
// ------------------------------------- Crear un nuevo estudiante -------------------------------------
CREATE (:Estudiante {
    id: 'E999',
    nombre: 'Nuevo Estudiante',
    carrera: 'Ingeniería',
    semestre: toInteger(9)
});

// ------------------------------------- Crear una nueva inscripción -------------------------------------
CREATE (e:Estudiante {id: 'E999'}) - [:INSCRITO_EN {calificacion: toFloat(9.99)}] -> (m:Materia {id: 'M001'});


///////////////////////////////////////    READ    /////////////////////////////////////////
// ------------------------------------- COnsultar Estudiantes -------------------------------------
MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

// ------------------------------------- COnsultar MateriAs---------------------------------------
MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

// ------------------------------------- COnsultar amigos -------------------------------------

MATCH (e_o:Estudiante) -[:AMIGO_DE]- (e_d:Estudiante)
RETURN e_o.nombre AS amigo1, e_d.nombre AS amigo2;

MATCH (e:Estudiante) - [:INSCRITO_EN]-> (m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia;

MATCH (p:Profesor) - [:IMPARTE]-> (m:Materia)
RETURN p.nombre AS profesor, m.nombre AS materia;

///////////////////////////////////////    UPDATE    /////////////////////////////////////////

// ------------------------------------- Actualizar el semestre -------------------------------------

MATCH (e:Estudiante {id: 'E999'})
SET e.semestre = toInteger(10);

MATCH (e:Estudiante {id: 'E999'}) - [r:INSCRITO_EN]-> (m:Materia {id: 'M001'})
SET r.calificacion = toFloat(6.66);

///////////////////////////////////////    DELETE    /////////////////////////////////////////

// ------------------------------------- Eliminar una relación -------------------------------------

MATCH (e:Estudiante {id: 'E999'}) - [r:INSCRITO_EN]-> (m:Materia {id: 'M001'})
DELETE r;

// ------------------------------------- Eliminar un nodo -------------------------------------
MATCH (e:Estudiante {id: 'E999'})
DELETE e;

