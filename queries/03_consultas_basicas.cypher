MATCH (n)
RETURN n;

MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;

MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;

MATCH (p:Profesor)
RETURN p.id, p.nombre, p.departamento;

MATCH (e:Estudiante)-[:INSCRITO_EN]->(m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia;

MATCH (p:Profesor)-[:IMPARTE]->(m:Materia)
RETURN p.nombre AS profesor, m.nombre AS materia;