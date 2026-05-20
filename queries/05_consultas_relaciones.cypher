////////////////////////////////////////////// CONSULTAS DE RELACIONES EN NEO4J //////////////////////////////////////////////

// ------------------------------------- Consultar amigos directos de Ana ----------------------------------------------------

MATCH (e:Estudiante {nombre: 'Ana'}) -[:AMIGO_DE]- (amigo:Estudiante)
RETURN amigo.nombre AS amigo_de_Ana;

// ------------------------------------- Consultar Materias que cursan los amigos de Ana -------------------------------------

MATCH (e:Estudiante {nombre: 'Ana'}) -[:AMIGO_DE]- (amigo:Estudiante) -[:INSCRITO_EN]-> (m:Materia)
RETURN m.nombre AS materias_cursadas_por_amigos_de_Ana;

// ------------------------- Consultar profesores que imparten materias que cursan los amigos de Ana -------------------------

MATCH (e:Estudiante {nombre: 'Ana'}) -[:AMIGO_DE]- (amigo:Estudiante) -[:INSCRITO_EN]-> (m:Materia) <-[:IMPARTE]- (p:Profesor)
RETURN p.nombre AS profesores_de_materias_cursadas_por_amigos_de_Ana;

// -------------------------------------------- Consultar amigos de amigos de Ana --------------------------------------------

MATCH (ana:Estudiante {nombre: 'Ana'}) -[:AMIGO_DE]- (directo:Estudiante) -[:AMIGO_DE]- (indirecto:Estudiante)
RETURN directo.nombre AS amigo_directo, indirecto.nombre AS amigo_indirecto;

// ------------------------------------------- estudiantes con calificación => a 9 -------------------------------------------

MATCH (e:Estudiante) - [r:INSCRITO_EN]-> (m:Materia)
WHERE r.calificacion >= 9
RETURN e.nombre AS estudiante, m.nombre AS materia, r.calificacion AS calificacion;

