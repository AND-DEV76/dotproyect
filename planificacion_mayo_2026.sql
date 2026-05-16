-- Planificacion limpia para dotProject
-- Proyecto: Implementacion y Gestion de un Servidor de Correos Empresarial
-- Objetivo: reemplazar la planificacion actual con una nueva version
-- Fechas: mayo 2026, duracion en dias

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Limpieza completa de la planificacion anterior
DELETE FROM dotprojecttask_dependencies;
DELETE FROM dotprojecttask_contacts;
DELETE FROM dotprojecttask_departments;
DELETE FROM dotprojecttask_log;
DELETE FROM dotprojectuser_tasks;
DELETE FROM dotprojectuser_task_pin;
DELETE FROM dotprojecttasks WHERE task_project = 1;

-- Actualizacion del proyecto principal
UPDATE dotprojectprojects
SET
  project_name = 'Implementacion y Gestion de un Servidor de Correos Empresarial',
  project_short_name = 'MAIL-SERVE',
  project_start_date = '2026-05-01 08:00:00',
  project_end_date = '2026-05-31 17:00:00',
  project_status = 3,
  project_percent_complete = 0,
  project_color_identifier = '#1f6feb',
  project_description = 'Proyecto de infraestructura para centralizar la comunicacion empresarial mediante un servidor de correos con Docker, Postfix, Dovecot y MariaDB.',
  project_target_budget = 10.00,
  project_actual_budget = 0.00,
  project_priority = 1,
  project_type = 1,
  project_owner = 1,
  project_creator = 1,
  project_private = 0
WHERE project_id = 1;

-- Insercion de tareas en orden jerarquico
INSERT INTO dotprojecttasks
(task_id, task_name, task_parent, task_milestone, task_project, task_owner, task_start_date, task_duration, task_duration_type, task_hours_worked, task_end_date, task_status, task_priority, task_percent_complete, task_description, task_target_budget, task_related_url, task_creator, task_order, task_client_publish, task_dynamic, task_access, task_notify, task_departments, task_contacts, task_custom, task_type)
VALUES
(1, 'Fase 1 - Analisis', 0, 0, 1, 1, '2026-05-01 08:00:00', 5, 1, 0, '2026-05-05 17:00:00', 0, 1, 0, 'Analisis inicial del problema, requerimientos y riesgos del servidor de correos.', 0.00, '', 1, 1, 0, 0, 0, 0, '', '', NULL, 0),
(2, '1.1 Identificacion del problema empresarial', 1, 0, 1, 1, '2026-05-01 08:00:00', 1, 1, 0, '2026-05-01 17:00:00', 0, 1, 0, 'Detectar el problema de usar correos personales para actividades laborales.', 0.00, '', 1, 2, 0, 0, 0, 0, '', '', NULL, 0),
(3, '1.2 Definicion de requerimientos', 1, 0, 1, 1, '2026-05-02 08:00:00', 1, 1, 0, '2026-05-02 17:00:00', 0, 1, 0, 'Definir necesidades funcionales y tecnicas del servidor de correo.', 0.00, '', 1, 3, 0, 0, 0, 0, '', '', NULL, 0),
(4, '1.3 Seleccion de tecnologias', 1, 0, 1, 1, '2026-05-03 08:00:00', 1, 1, 0, '2026-05-03 17:00:00', 0, 1, 0, 'Seleccionar Docker, Postfix, Dovecot y MariaDB como base de la infraestructura.', 0.00, '', 1, 4, 0, 0, 0, 0, '', '', NULL, 0),
(5, '1.4 Analisis de seguridad', 1, 0, 1, 1, '2026-05-04 08:00:00', 1, 1, 0, '2026-05-04 17:00:00', 0, 1, 0, 'Identificar controles de acceso, contraseñas y proteccion de informacion.', 0.00, '', 1, 5, 0, 0, 0, 0, '', '', NULL, 0),
(6, '1.5 Documento de analisis', 1, 0, 1, 1, '2026-05-05 08:00:00', 1, 1, 0, '2026-05-05 17:00:00', 0, 1, 0, 'Redactar el documento de analisis y alcance del proyecto.', 0.00, '', 1, 6, 0, 0, 0, 0, '', '', NULL, 0),

(7, 'Fase 2 - Diseno', 0, 0, 1, 1, '2026-05-06 08:00:00', 5, 1, 0, '2026-05-10 17:00:00', 0, 1, 0, 'Diseno de arquitectura, usuarios, buzones y seguridad del sistema.', 0.00, '', 1, 7, 0, 0, 0, 0, '', '', NULL, 0),
(8, '2.1 Diseno de arquitectura del servidor', 7, 0, 1, 1, '2026-05-06 08:00:00', 1, 1, 0, '2026-05-06 17:00:00', 0, 1, 0, 'Definir la arquitectura general del servidor de correos.', 0.00, '', 1, 8, 0, 0, 0, 0, '', '', NULL, 0),
(9, '2.2 Diseno de usuarios y buzones', 7, 0, 1, 1, '2026-05-07 08:00:00', 1, 1, 0, '2026-05-07 17:00:00', 0, 1, 0, 'Estructurar usuarios empresariales y buzones de correo.', 0.00, '', 1, 9, 0, 0, 0, 0, '', '', NULL, 0),
(10, '2.3 Diseno de seguridad', 7, 0, 1, 1, '2026-05-08 08:00:00', 1, 1, 0, '2026-05-08 17:00:00', 0, 1, 0, 'Definir autenticacion, permisos y politicas de seguridad.', 0.00, '', 1, 10, 0, 0, 0, 0, '', '', NULL, 0),
(11, '2.4 Diseno del flujo de correo', 7, 0, 1, 1, '2026-05-09 08:00:00', 1, 1, 0, '2026-05-09 17:00:00', 0, 1, 0, 'Diseñar el flujo SMTP, IMAP y POP3 dentro del sistema.', 0.00, '', 1, 11, 0, 0, 0, 0, '', '', NULL, 0),
(12, '2.5 Diagramas y documentacion', 7, 0, 1, 1, '2026-05-10 08:00:00', 1, 1, 0, '2026-05-10 17:00:00', 0, 1, 0, 'Elaborar diagramas de arquitectura y documentacion tecnica.', 0.00, '', 1, 12, 0, 0, 0, 0, '', '', NULL, 0),

(13, 'Fase 3 - Planificacion', 0, 0, 1, 1, '2026-05-11 08:00:00', 5, 1, 0, '2026-05-15 17:00:00', 0, 1, 0, 'Planificacion del cronograma, recursos, riesgos y tiempos.', 0.00, '', 1, 13, 0, 0, 0, 0, '', '', NULL, 0),
(14, '3.1 Elaboracion del cronograma', 13, 0, 1, 1, '2026-05-11 08:00:00', 1, 1, 0, '2026-05-11 17:00:00', 0, 1, 0, 'Definir el cronograma general del proyecto.', 0.00, '', 1, 14, 0, 0, 0, 0, '', '', NULL, 0),
(15, '3.2 Asignacion de recursos', 13, 0, 1, 1, '2026-05-12 08:00:00', 1, 1, 0, '2026-05-12 17:00:00', 0, 1, 0, 'Asignar equipo, herramientas y recursos de infraestructura.', 0.00, '', 1, 15, 0, 0, 0, 0, '', '', NULL, 0),
(16, '3.3 Gestion de riesgos', 13, 0, 1, 1, '2026-05-13 08:00:00', 1, 1, 0, '2026-05-13 17:00:00', 0, 1, 0, 'Identificar riesgos tecnicos, operativos y de seguridad.', 0.00, '', 1, 16, 0, 0, 0, 0, '', '', NULL, 0),
(17, '3.4 Definicion de tiempos', 13, 0, 1, 1, '2026-05-14 08:00:00', 1, 1, 0, '2026-05-14 17:00:00', 0, 1, 0, 'Ajustar duraciones y fechas de entrega por actividad.', 0.00, '', 1, 17, 0, 0, 0, 0, '', '', NULL, 0),

(18, 'Fase 4 - Implementacion', 0, 0, 1, 1, '2026-05-16 08:00:00', 8, 1, 0, '2026-05-23 17:00:00', 0, 1, 0, 'Implementacion simulada de Docker, Postfix, Dovecot y MariaDB.', 0.00, '', 1, 18, 0, 0, 0, 0, '', '', NULL, 0),
(19, '4.1 Instalacion de Docker', 18, 0, 1, 1, '2026-05-16 08:00:00', 1, 1, 0, '2026-05-16 17:00:00', 0, 1, 0, 'Instalar y validar Docker como base de contenedores.', 0.00, '', 1, 19, 0, 0, 0, 0, '', '', NULL, 0),
(20, '4.2 Configuracion de contenedores', 18, 0, 1, 1, '2026-05-17 08:00:00', 1, 1, 0, '2026-05-17 17:00:00', 0, 1, 0, 'Configurar contenedores para los servicios del correo.', 0.00, '', 1, 20, 0, 0, 0, 0, '', '', NULL, 0),
(21, '4.3 Configuracion de Postfix', 18, 0, 1, 1, '2026-05-18 08:00:00', 1, 1, 0, '2026-05-18 17:00:00', 0, 1, 0, 'Configurar el servicio SMTP para el envio de correo.', 0.00, '', 1, 21, 0, 0, 0, 0, '', '', NULL, 0),
(22, '4.4 Configuracion de Dovecot', 18, 0, 1, 1, '2026-05-19 08:00:00', 1, 1, 0, '2026-05-19 17:00:00', 0, 1, 0, 'Configurar IMAP y POP3 para recepcion de correo.', 0.00, '', 1, 22, 0, 0, 0, 0, '', '', NULL, 0),
(23, '4.5 Configuracion de MariaDB', 18, 0, 1, 1, '2026-05-20 08:00:00', 1, 1, 0, '2026-05-20 17:00:00', 0, 1, 0, 'Configurar la base de datos para usuarios, buzones y metadatos.', 0.00, '', 1, 23, 0, 0, 0, 0, '', '', NULL, 0),
(24, '4.6 Configuracion de seguridad', 18, 0, 1, 1, '2026-05-21 08:00:00', 1, 1, 0, '2026-05-21 17:00:00', 0, 1, 0, 'Aplicar contraseñas seguras, acceso controlado y proteccion basica.', 0.00, '', 1, 24, 0, 0, 0, 0, '', '', NULL, 0),
(25, '4.7 Pruebas funcionales', 18, 0, 1, 1, '2026-05-22 08:00:00', 1, 1, 0, '2026-05-22 17:00:00', 0, 1, 0, 'Probar envio, recepcion y autenticacion de correos.', 0.00, '', 1, 25, 0, 0, 0, 0, '', '', NULL, 0),
(26, '4.8 Documentacion tecnica', 18, 0, 1, 1, '2026-05-23 08:00:00', 1, 1, 0, '2026-05-23 17:00:00', 0, 1, 0, 'Registrar configuraciones, evidencias y manual tecnico.', 0.00, '', 1, 26, 0, 0, 0, 0, '', '', NULL, 0),

(27, 'Fase 5 - Evaluacion', 0, 0, 1, 1, '2026-05-24 08:00:00', 8, 1, 0, '2026-05-31 17:00:00', 0, 1, 0, 'Evaluacion de resultados, beneficios y costo-beneficio del sistema.', 0.00, '', 1, 27, 0, 0, 0, 0, '', '', NULL, 0),
(28, '5.1 Evaluacion del sistema', 27, 0, 1, 1, '2026-05-24 08:00:00', 2, 1, 0, '2026-05-25 17:00:00', 0, 1, 0, 'Analizar el comportamiento general del servidor de correo.', 0.00, '', 1, 28, 0, 0, 0, 0, '', '', NULL, 0),
(29, '5.2 Analisis de beneficios', 27, 0, 1, 1, '2026-05-26 08:00:00', 2, 1, 0, '2026-05-27 17:00:00', 0, 1, 0, 'Describir las mejoras en comunicacion y organizacion.', 0.00, '', 1, 29, 0, 0, 0, 0, '', '', NULL, 0),
(30, '5.3 Analisis costo-beneficio', 27, 0, 1, 1, '2026-05-28 08:00:00', 2, 1, 0, '2026-05-29 17:00:00', 0, 1, 0, 'Comparar costo de implementacion con beneficios obtenidos.', 0.00, '', 1, 30, 0, 0, 0, 0, '', '', NULL, 0),
(31, '5.4 Conclusiones finales', 27, 0, 1, 1, '2026-05-30 08:00:00', 2, 1, 0, '2026-05-31 17:00:00', 0, 1, 0, 'Cerrar el proyecto con conclusiones y recomendaciones finales.', 0.00, '', 1, 31, 0, 0, 0, 0, '', '', NULL, 0);

-- Dependencias entre fases principales para que el Gantt las ordene mejor
INSERT INTO dotprojecttask_dependencies (dependencies_task_id, dependencies_req_task_id) VALUES
(7, 1),
(13, 7),
(18, 13),
(27, 18);

SET FOREIGN_KEY_CHECKS = 1;
