////////////////////////////////////////////// CONSULTAS DE RELACIONES EN NEO4J //////////////////////////////////////////////

// ------------------------------------- Consultar amigos directos de Ana ----------------------------------------------------

MATCH (ana:Estudiante {nombre: 'Ana'}) <-[r:AMIGO_DE]-> (amigo:Estudiante)
RETURN ana, r, amigo;

// ------------------------------------- Consultar Materias que cursan los amigos de Ana -------------------------------------

MATCH (ana:Estudiante {nombre: 'Ana'}) <-[a:AMIGO_DE]-> (amigo:Estudiante) -[r:INSCRITO_EN]-> (m:Materia)
RETURN ana, a, amigo, r, m;

// ------------------------- Consultar profesores que imparten materias que cursan los amigos de Ana -------------------------

MATCH (ana:Estudiante {nombre: 'Ana'}) <-[amistad:AMIGO_DE]-> (amigo:Estudiante) -[r:INSCRITO_EN]-> (m:Materia) <-[im:IMPARTE]-> (p:Profesor)
RETURN ana, amistad, amigo, r, m, im, p;

// -------------------------------------------- Consultar amigos de amigos de Ana --------------------------------------------

MATCH (ana:Estudiante {nombre: 'Ana'}) <-[r1:AMIGO_DE]-> (directo:Estudiante) <-[r2:AMIGO_DE]-> (indirecto:Estudiante) <-[lejos:AMIGO_DE]-> (lejano:Estudiante)
RETURN ana, r1, directo, r2, indirecto, lejos, lejano;

// ------------------------------------------- estudiantes con calificación => a 9 -------------------------------------------

MATCH (e:Estudiante) - [r:INSCRITO_EN]-> (m:Materia)
WHERE r.calificacion >= 9
RETURN e, r, m;

// -------- imprimir nodos y relaciones -----
MATCH (n) -[r]-> (m)
RETURN n, r, m;