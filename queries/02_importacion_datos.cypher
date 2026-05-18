// Este archivo contiene las consultas para importar los datos de los archivos CSV a la base de datos Neo4j.

// Asegúrate de ejecutar primero el archivo 01_creacion_restricciones.cypher para crear las restricciones necesarias antes de importar los datos.

// Importar datos de estudiantes -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/estudiantes.csv'

AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});

// Importar datos de materias -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/materias.csv'
AS row

CREATE (:Materia {
    id: row.id,
    nombre: row.nombre,
    area: row.area, 
})

// Importar datos de profesores -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/profesores.csv'
AS row

create (:Profesor {
    id: row.id,
    nombre: row.nombre,
    departamento: row.departamento
})

// Importar datos de inscripciones -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/inscripciones.csv'
AS row

CREATE (:Inscripcion {
    materia_id: row.materia_id,
    estudiante_id: row.estudiante_id,
    calificacion: toFloat(row.calificacion)
})