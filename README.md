[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=23947331)
# Práctica — Bases de Datos de Grafos con Neo4j AuraDB

## Objetivo

Configurar y utilizar una base de datos orientada a grafos utilizando Neo4j AuraDB, importar información desde archivos CSV alojados en GitHub y realizar operaciones CRUD y consultas sobre relaciones mediante Cypher.

---

# Introducción

Neo4j es una base de datos orientada a grafos que almacena información mediante:

- Nodos
- Relaciones
- Propiedades

A diferencia de las bases de datos relacionales, Neo4j permite representar y recorrer relaciones complejas de manera natural y eficiente.

En esta práctica se utilizarán:

- GitHub Classroom
- GitHub Codespaces
- Neo4j AuraDB
- Neo4j Browser
- Cypher

---

# Escenario

Se trabajará con una red social académica formada por:

- Estudiantes
- Materias
- Profesores
- Relaciones de amistad
- Relaciones de inscripción
- Relaciones de impartición

---

# Parte 1 — Aceptar asignación de GitHub Classroom

## Paso 1. Aceptar la asignación

El docente proporcionará un enlace de GitHub Classroom.

Al aceptar la asignación:

- GitHub generará automáticamente un repositorio individual.
- El repositorio incluirá:
  - estructura inicial
  - archivos CSV
  - README.md
  - scripts de autograde

---

# Parte 2 — Abrir el repositorio en Codespaces

## Paso 2. Abrir Codespaces

Seleccionar:

```text
Code → Codespaces → Create codespace on main
```

Codespaces será utilizado como:

- entorno de trabajo
- edición de archivos CSV
- documentación de consultas Cypher
- administración del repositorio GitHub

---

# Parte 3 — Crear cuenta en Neo4j AuraDB

## Paso 3. Crear cuenta

Entrar a:

```text
https://neo4j.com/cloud/aura/
```

Crear una cuenta gratuita.

---

## Paso 4. Crear instancia AuraDB Free

Crear una instancia:

- Tipo: AuraDB Free
- Región: la más cercana
- Usuario: neo4j
- Contraseña: definida por el alumno

Guardar las credenciales.

---

# Parte 4 — Acceder a Neo4j Browser

## Paso 5. Abrir Neo4j Browser

Desde AuraDB seleccionar:

```text
Open → Query
```

Esto abrirá Neo4j Browser.

---

# Parte 5 — Obtener URLs RAW de GitHub

Neo4j AuraDB únicamente puede importar archivos CSV desde URLs públicas.

## Paso 6. Obtener URL RAW

Para cada archivo CSV:

1. Abrir el archivo en GitHub.
2. Presionar:

```text
Raw
```

3. Copiar la URL.

Ejemplo:

```text
https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/estudiantes.csv
```

---

# Parte 6 — Crear restricciones

## Paso 7. Ejecutar restricciones

Documentar todas las consultas utilizadas en queries/01_creacion_restricciones.cypher

### Restricción para estudiantes

```cypher
CREATE CONSTRAINT estudiante_id IF NOT EXISTS
FOR (e:Estudiante)
REQUIRE e.id IS UNIQUE;
```

### Restricción para materias

```cypher
CREATE CONSTRAINT materia_id IF NOT EXISTS
FOR (m:Materia)
REQUIRE m.id IS UNIQUE;
```

### Restricción para profesores

```cypher
CREATE CONSTRAINT profesor_id IF NOT EXISTS
FOR (p:Profesor)
REQUIRE p.id IS UNIQUE;
```

---

# Parte 7 — Importación de datos

## Paso 8. Importar estudiantes

Documentar todas las consultas utilizadas en queries/02_importacion_datos.cypher

```cypher
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/USUARIO/REPOSITORIO/main/data/estudiantes.csv'
AS row

CREATE (:Estudiante {
  id: row.id,
  nombre: row.nombre,
  carrera: row.carrera,
  semestre: toInteger(row.semestre)
});
```

---

## Paso 9. Importar materias

Documentar todas las consultas utilizadas en queries/02_importacion_datos.cypher

---

## Paso 10. Importar profesores

Documentar todas las consultas utilizadas en queries/02_importacion_datos.cypher

---

## Paso 11. Crear relaciones de inscripción

Documentar todas las consultas utilizadas en queries/02_importacion_datos.cypher

---

## Paso 12. Crear relaciones de amistad

Documentar todas las consultas utilizadas en queries/02_importacion_datos.cypher

---

## Paso 13. Crear relaciones de impartición

Documentar todas las consultas utilizadas en queries/02_importacion_datos.cypher

---
# Parte 8 — Operaciones básicas de consulta

Una vez importados los datos, ejecutar las siguientes consultas básicas para verificar que los nodos y relaciones fueron creados correctamente.

Documentar cada consulta en queries/03_consultas_basicas.cypher y agregar capturas de pantalla en la carpeta:

```text
evidencias/
```

---

## Paso 14. Visualizar todos los nodos

```cypher
MATCH (n)
RETURN n;
```

Esta consulta permite visualizar todos los nodos y relaciones existentes en el grafo.

---

## Paso 15. Consultar estudiantes

```cypher
MATCH (e:Estudiante)
RETURN e.id, e.nombre, e.carrera, e.semestre;
```

La consulta debe mostrar la información de todos los estudiantes registrados.

---

## Paso 16. Consultar materias

```cypher
MATCH (m:Materia)
RETURN m.id, m.nombre, m.area;
```

La consulta debe mostrar todas las materias y su área correspondiente.

---

## Paso 17. Consultar profesores

```cypher
MATCH (p:Profesor)
RETURN p.id, p.nombre, p.departamento;
```

La consulta debe mostrar todos los profesores registrados.

---

## Paso 18. Consultar relaciones de inscripción

```cypher
MATCH (e:Estudiante)-[:INSCRITO_EN]->(m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia;
```

La consulta debe mostrar qué estudiantes están inscritos en qué materias.

---

## Paso 19. Consultar relaciones de impartición

```cypher
MATCH (p:Profesor)-[:IMPARTE]->(m:Materia)
RETURN p.nombre AS profesor, m.nombre AS materia;
```

La consulta debe mostrar qué profesores imparten cada materia.

---

# Parte 9 — Operaciones CRUD

Documentar todas las consultas utilizadas en queries/04_operaciones_crud.cypher para:

## CREATE

- Crear un nuevo estudiante
- Crear una nueva inscripción

## READ

- Consultar estudiantes
- Consultar materias
- Consultar relaciones

## UPDATE

- Modificar semestre
- Modificar calificaciones

## DELETE

- Eliminar una relacion
- Eliminar un nodo

---

# Parte 10 — Consultas sobre relaciones

Documentar todas las consultas utilizadas en queries/05_consultas_relaciones.cypher para:

- Amigos directos de Ana
- Materias que cursan los amigos de Ana
- Profesores que imparten materias cursadas por amigos de Ana
- Estudiantes conectados con Ana hasta dos niveles de amistad
- Consultar estudiantes con calificaciones mayores o iguales a 90. Mostrar nombre de estudiante, nombre de materia y calificación


---

# Parte 11 — Evidencias

Guardar capturas en la carpeta:

```text
evidencias/
```

Incluir:

1. AuraDB funcionando.
2. Importación de datos.
3. Grafo generado.
4. Operaciones CRUD.
5. Consultas de relaciones.
6. Evidencias de consultas transversales.

---

# Parte 12 — Reflexión

Responder:

1. ¿Qué ventajas tienen las bases de datos de grafos?
Las bases de datos de grafos permiten consultas complejas de redes de relaciones entre elementos profundamente interconectados. Una de las principales características es la eficiecia con la que se trabaja en este tipo de bases de datos por su optimización computacional en comparación con las bases de datos relacionales.

2. ¿Qué diferencia existe entre relaciones en grafos y llaves foráneas?
Las relaciones en los grafos son de esquema más flexible; si una relacion existe, se puede consultar y operar con ella. A diferencia de en una base de datos relacional, en la que las interrelaciones entre elementos quedan estrictamente retringidas por un esquema rígido, por lo que las consultas y operaciones están limitadas, no permiten la escalabilidad horizontal y las consultas complejas se vuelven costosas.

3. ¿Qué ventajas observó al utilizar Cypher?
Es bastante intuitivo, dada la manera en la que fue diseñado su sintaxis, su entendimiento es muy visual; casi como si estuviera teniendo una pequeña vista previa en el mismo código.

4. ¿Qué consultas fueron más fáciles de representar en Neo4j?
La verdad es que todas fueron bastante fáciles de representar. Tanto la representación visual de los grafos, como la sintaxis de Cypher facilitan la abtracción de consultas profundas.

5. ¿Qué dificultades encontró?
Una de las pricipales dificultades fue al momento de importar las relaciones, ya que no estaba familiarizado con la sintaxis. Al momento de intentar crear las relaciones, me arrojaba errores porque detectaba duplicidad al importar elementos que ya existían en la base de datos y existia una restricción de propiedades únicas. 
```
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/amistades.csv'
AS row
CREATE (Estudiante {id: row.estudiante_origen}) -[:AMIGO_DE]-> (Estudiante {id:row.estudiante_destino});
```
Una vez que investigué, me di cuenta que para ese tipo de casos se utiliza como mejor práctica el comando `MERGE` y para configurar las propiedades de la relación se utiliza `SET`.
```
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-al261172/refs/heads/main/data/amistades.csv'
AS row
MERGE (e1:Estudiante {id: row.estudiante_origen})
MERGE (e2:Estudiante {id: row.estudiante_destino})
MERGE (e1)-[:AMIGO_DE]->(e2);
```

---

# Comandos Cypher utilizados

| Comando | Función |
|---|---|
| CREATE | Crear nodos y relaciones |
| MATCH | Buscar nodos y relaciones |
| RETURN | Mostrar resultados |
| SET | Actualizar propiedades |
| DELETE | Eliminar elementos |
| DETACH DELETE | Eliminar nodos con relaciones |
| LOAD CSV | Importar datos |
| WHERE | Filtrar |
| DISTINCT | Evitar duplicados |

---

# Resultado esperado

Al finalizar la práctica el estudiante deberá:

- Utilizar Neo4j AuraDB.
- Importar datos desde GitHub.
- Crear nodos y relaciones.
- Ejecutar operaciones CRUD.
- Realizar consultas sobre relaciones.
- Comprender el funcionamiento básico de una base de datos orientada a grafos.
- Documentar adecuadamente consultas y evidencias.
