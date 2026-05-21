// Este archivo contiene las consultas para importar los datos de los archivos CSV a la base de datos Neo4j.

// Asegúrate de ejecutar primero el archivo 01_creacion_restricciones.cypher para crear las restricciones necesarias antes de importar los datos.

// ------------------------------------- Importar datos de estudiantes -------------------------------------
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/estudiantes.csv'
AS row
CREATE (e:Estudiante {
   nombre: row.nombre,
   id: row.id,
   carrera: row.carrera,
   semestre: toInteger(row.semestre)
});

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/materias.csv'
AS row
CREATE (m:Materia {
    nombre: row.nombre,
    id: row.id,
    area: row.area,
    creditos: toInteger(row.creditos)
});


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/profesores.csv'
AS row
CREATE (p:Profesor {
    nombre: row.nombre,
    id: row.id,
    departamento: row.departamento
});

LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/inscripciones.csv'
AS row
MERGE (e:Estudiante {id:row.estudiante_id})
MERGE (m:Materia {id:row.materia_id})
MERGE (e)-[r:INSCRITO_EN]->(m)
ON CREATE SET r.calificacion = toFloat(row.calificacion);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/amistades.csv'
AS row
MERGE (e1:Estudiante {id: row.estudiante_origen})
MERGE (e2:Estudiante {id: row.estudiante_destino})
MERGE (e1)-[:AMIGO_DE]->(e2);


LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/imparticiones.csv'
AS row
MERGE (p:Profesor {id: row.profesor_id})
MERGE (m:Materia {id: row.materia_id})
MERGE (p)-[:IMPARTE]->(m);