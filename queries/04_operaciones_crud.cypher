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
MERGE (e:Estudiante {id:'E999'})
MERGE (m:Materia {id: 'M001'})
MERGE (e) -[:INSCRITO_EN {calificacion: toFloat(99.9)}]-> (m);


///////////////////////////////////////    READ    /////////////////////////////////////////
// ------------------------------------- COnsultar Estudiantes -------------------------------------
MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

MATCH (e:Estudiante)
RETURN e;

// ------------------------------------- COnsultar MateriAs---------------------------------------
MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

MATCH (m:Materia)
RETURN m;

// ------------------------------------- COnsultar amigos -------------------------------------

MATCH (e_o:Estudiante) -[:AMIGO_DE]- (e_d:Estudiante)
RETURN e_o.nombre AS amigo1, e_d.nombre AS amigo2;

MATCH (e_o:Estudiante) -[r:AMIGO_DE]- (e_d:Estudiante)
RETURN e_o, r, e_d;


MATCH (e:Estudiante) - [:INSCRITO_EN]-> (m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia;
MATCH (e:Estudiante) - [r:INSCRITO_EN]-> (m:Materia)
RETURN e,r,m;


MATCH (p:Profesor) - [:IMPARTE]-> (m:Materia)
RETURN p.nombre AS profesor, m.nombre AS materia;
MATCH (p:Profesor) - [r:IMPARTE]-> (m:Materia)
RETURN p,r,m;


///////////////////////////////////////    UPDATE    /////////////////////////////////////////

// ------------------------------------- Actualizar el semestre -------------------------------------

MATCH (e:Estudiante {id: 'E999'})
SET e.semestre = toInteger(10);

MATCH (e:Estudiante {id: 'E999'}) - [r:INSCRITO_EN]-> (m:Materia {id: 'M001'})
SET r.calificacion = toFloat(66.66);

///////////////////////////////////////    DELETE    /////////////////////////////////////////

// ------------------------------------- Eliminar una relación -------------------------------------

MATCH (e:Estudiante {id: 'E999'}) - [r:INSCRITO_EN]-> (m:Materia {id: 'M001'})
DELETE r;

// ------------------------------------- Eliminar un nodo -------------------------------------
MATCH (e:Estudiante {id: 'E999'})
DELETE e;

