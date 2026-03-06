-- primer paso 
-- busco el reporte del asesinato con su fecha que nso indican al inicio y el tipo que en este 
-- caso es asesinato

SELECT *
FROM crime_scene_report
Where type = "murder"
and city = "SQL City"
and date = "20180115";

-- Segundo paso y segundo paso 0.1, intentamos buscar a nuestros testigos por medio de lo indicado antes con 
-- sus nombres o donde vives, primero annabel, ya que hay varios annabel buscamos con % y su direccion

SELECT *
FROM person
WHERE name LIKE 'Annabel%'
and address_street_name = "Franklin Ave";
---------------------------------
-- y despues la calle north donde buscamos la ultima casa con el numero de direccion, el desc para no 
-- bajar del todo en la tabla

SELECT *
FROM person
where address_street_name = "Northwestern Dr"
order by address_number desc;

-- tercer paso, buscamos las entrevistas a las dos personas ya encontradas con sus respectivas id, 
--primero a morty y despues con annabel

SELECT *
FROM interview
where person_id = 14887;
----------------------------------
SELECT *
FROM interview
where person_id = 16371;

-- cuarto paso, con la informacion de la bolsa y la matricula del carro primero vamos al gymnasio 
-- buscamos el cliente gold y la pista de las iniciales de la bolsa, dando dos candidatos y despues 
--vamos a ver si coincide con la placa del auto

SELECT *
FROM get_fit_now_member
where membership_status = "gold"
and id like "48Z%";
-----------------------------------
-- para saber su licencia como ya tenemos su licencia vamos a la tabla persona y extraemos la informacion
SELECT *
FROM person -- este es joe con licencia 173289
where id = 28819;
-----------------------------------
SELECT *
FROM person --este es jeremy con licencia 423327
where id = 67318;
-----------------------------------
-- al buscar entre los dos candidatos y poners sus ids solo nos aparece jeremy
SELECT *
FROM drivers_license
where id in(173289,423327);

-- Quinto paso, intervenimos a jeremy y dice ser contratado por una mujer entre 1,65 y 1,70 
-- ademas dice que fue a un concierto en diciembre de 2017 asi que vamos a ir a redes sociales

SELECT *
FROM interview
where person_id = 67318;
-----------------------------------
-- en redes sociales vamos a buscar por lo que nos menciona jeremy y tenemos dos sospechosos que van 
-- tres veces en diciembre, lo que hacemos es simplemente ordenar la tabla para dar con la fecha, y las 
-- tres veces que van 
SELECT person_id, COUNT(*) as veces
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date LIKE '201712%'
GROUP BY person_id
HAVING COUNT(*) = 3;

-- sexto paso 
-- vamos a buscar la informacion de las dos personas que tenemos sopechosas y no encontramos con una 
--mujer y un hombre, por descarte nos quedamos con la mujer

SELECT *
FROM person
where id in(99716, 24556);

-- por ultimo tenemos exactamente las caracteristicas de la mujer de la que nos habla jeremy

SELECT *
FROM drivers_license
WHERE id = 202298;

-- septimo paso
--por ultimo como damos con lo que nos dice jeremy llegamos a la conlusion de que miranda es 
-- el cerebro de la operacion. 

INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;









