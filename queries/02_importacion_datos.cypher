// Este archivo contiene las consultas para importar los datos de los archivos CSV a la base de datos Neo4j.

// Asegúrate de ejecutar primero el archivo 01_creacion_restricciones.cypher para crear las restricciones necesarias antes de importar los datos.

// ------------------------------------- Importar datos de estudiantes -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/estudiantes.csv'

AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});

// ------------------------------------- Importar datos de materias -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/materias.csv'
AS row

CREATE (:Materia {
    id: row.id,
    nombre: row.nombre,
    creditos: toInteger(row.creditos)
});

// -------------------------------------Importar datos de profesores -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/profesores.csv'
AS row

CREATE (:Profesor {
    id: row.id,
    nombre: row.nombre,
    departamento: row.departamento
});

// ------------------------------------- Importar datos de inscripciones -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/inscripciones.csv'
AS row
MATCH (e:Estudiante {id: row.estudiante_id})
WITH e, row
MATCH (m:Materia {id: row.materia_id})
CREATE (e) - [:INSCRITO_EN {calificacion: toFloat(row.calificacion)}] -> (m);

// ------------------------------------- Importar datos de amistades -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/amistades.csv'
AS row

MATCH (e_o:Estudiante {id: row.estudiante_origen})
WITH e_o, row
MATCH (e_d:Estudiante {id: row.estudiante_destino})
CREATE (e_o) - [:AMIGO_DE] -> (e_d);

// ------------------------------------- Importar datos de imparticiones -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/imparticiones.csv'
AS row
MATCH (p:Profesor {id: row.profesor_id})
WITH p, row
MATCH (m:Materia {id: row.materia_id})
CREATE (p) - [:IMPARTE] -> (m);