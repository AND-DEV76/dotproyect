USE `dotproject`;

SET FOREIGN_KEY_CHECKS=0;
START TRANSACTION;

-- =========================================================
-- 1) ESTRUCTURA ORGANIZACIONAL
-- =========================================================

INSERT INTO `dotprojectdepartments`
(`dept_id`,`dept_parent`,`dept_company`,`dept_name`,`dept_phone`,`dept_fax`,`dept_address1`,`dept_address2`,`dept_city`,`dept_state`,`dept_zip`,`dept_url`,`dept_desc`,`dept_owner`)
VALUES
(1,0,1,'Infraestructura y Soporte','55555555',NULL,NULL,NULL,'Guatemala','Chimaltenango','748',NULL,'Departamento responsable de la implementación y gestión del servidor de correos empresarial.',1)
ON DUPLICATE KEY UPDATE
`dept_parent`=VALUES(`dept_parent`),
`dept_company`=VALUES(`dept_company`),
`dept_name`=VALUES(`dept_name`),
`dept_phone`=VALUES(`dept_phone`),
`dept_city`=VALUES(`dept_city`),
`dept_state`=VALUES(`dept_state`),
`dept_zip`=VALUES(`dept_zip`),
`dept_desc`=VALUES(`dept_desc`),
`dept_owner`=VALUES(`dept_owner`);

INSERT INTO `dotprojectroles`
(`role_id`,`role_name`,`role_description`,`role_type`,`role_module`)
VALUES
(1,'Infraestructura','Responsable de contenedores, red y despliegue',0,0),
(2,'Servicios','Responsable de Postfix, Dovecot y correo',0,0),
(3,'Seguridad','Responsable de accesos, contraseñas y control',0,0)
ON DUPLICATE KEY UPDATE
`role_name`=VALUES(`role_name`),
`role_description`=VALUES(`role_description`),
`role_type`=VALUES(`role_type`),
`role_module`=VALUES(`role_module`);

INSERT INTO `dotprojectcontacts`
(`contact_id`,`contact_first_name`,`contact_last_name`,`contact_order_by`,`contact_title`,`contact_birthday`,`contact_job`,`contact_company`,`contact_department`,`contact_type`,`contact_email`,`contact_email2`,`contact_url`,`contact_phone`,`contact_phone2`,`contact_fax`,`contact_mobile`,`contact_address1`,`contact_address2`,`contact_city`,`contact_state`,`contact_zip`,`contact_country`,`contact_jabber`,`contact_icq`,`contact_msn`,`contact_yahoo`,`contact_aol`,`contact_notes`,`contact_project`,`contact_icon`,`contact_owner`,`contact_private`)
VALUES
(2,'Juan','Pérez','Juan Pérez','Programador 1',NULL,'Infraestructura','TechMail Solutions','Infraestructura y Soporte','Empleado','infra@techmail.com',NULL,NULL,'55550001',NULL,NULL,NULL,NULL,NULL,'Guatemala','Chimaltenango',NULL,'Guatemala',NULL,NULL,NULL,NULL,NULL,'Encargado de infraestructura y contenedores.',1,'obj/contact',1,0),
(3,'María','López','María López','Programador 2',NULL,'Servicios','TechMail Solutions','Infraestructura y Soporte','Empleado','servicios@techmail.com',NULL,NULL,'55550002',NULL,NULL,NULL,NULL,NULL,'Guatemala','Chimaltenango',NULL,'Guatemala',NULL,NULL,NULL,NULL,NULL,'Encargada de configuración de servicios de correo.',1,'obj/contact',1,0),
(4,'Carlos','Gómez','Carlos Gómez','Programador 3',NULL,'Seguridad y Gestión','TechMail Solutions','Infraestructura y Soporte','Empleado','seguridad@techmail.com',NULL,NULL,'55550003',NULL,NULL,NULL,NULL,NULL,'Guatemala','Chimaltenango',NULL,'Guatemala',NULL,NULL,NULL,NULL,NULL,'Encargado de seguridad, gestión y validación.',1,'obj/contact',1,0)
ON DUPLICATE KEY UPDATE
`contact_first_name`=VALUES(`contact_first_name`),
`contact_last_name`=VALUES(`contact_last_name`),
`contact_order_by`=VALUES(`contact_order_by`),
`contact_title`=VALUES(`contact_title`),
`contact_job`=VALUES(`contact_job`),
`contact_company`=VALUES(`contact_company`),
`contact_department`=VALUES(`contact_department`),
`contact_type`=VALUES(`contact_type`),
`contact_email`=VALUES(`contact_email`),
`contact_phone`=VALUES(`contact_phone`),
`contact_city`=VALUES(`contact_city`),
`contact_state`=VALUES(`contact_state`),
`contact_country`=VALUES(`contact_country`),
`contact_notes`=VALUES(`contact_notes`),
`contact_project`=VALUES(`contact_project`),
`contact_owner`=VALUES(`contact_owner`);

INSERT INTO `dotprojectusers`
(`user_id`,`user_contact`,`user_username`,`user_password`,`user_parent`,`user_type`,`user_company`,`user_department`,`user_owner`,`user_signature`)
VALUES
(2,2,'programador1',MD5('infra123'),0,0,1,1,1,'Infraestructura'),
(3,3,'programador2',MD5('servicios123'),0,0,1,1,1,'Servicios'),
(4,4,'programador3',MD5('seguridad123'),0,0,1,1,1,'Seguridad y Gestión')
ON DUPLICATE KEY UPDATE
`user_contact`=VALUES(`user_contact`),
`user_username`=VALUES(`user_username`),
`user_password`=VALUES(`user_password`),
`user_parent`=VALUES(`user_parent`),
`user_type`=VALUES(`user_type`),
`user_company`=VALUES(`user_company`),
`user_department`=VALUES(`user_department`),
`user_owner`=VALUES(`user_owner`),
`user_signature`=VALUES(`user_signature`);

DELETE FROM `dotprojectuser_roles` WHERE `user_id` IN (2,3,4);

INSERT INTO `dotprojectuser_roles`
(`user_id`,`role_id`)
VALUES
(2,1),
(3,2),
(4,3)
ON DUPLICATE KEY UPDATE
`role_id`=VALUES(`role_id`);

-- =========================================================
-- 2) PROYECTO PRINCIPAL
-- =========================================================

INSERT INTO `dotprojectprojects`
(`project_id`,`project_company`,`project_company_internal`,`project_department`,`project_name`,`project_short_name`,`project_owner`,`project_url`,`project_demo_url`,`project_start_date`,`project_end_date`,`project_status`,`project_percent_complete`,`project_color_identifier`,`project_description`,`project_target_budget`,`project_actual_budget`,`project_creator`,`project_private`,`project_departments`,`project_contacts`,`project_priority`,`project_type`)
VALUES
(1,1,0,1,'Implementación y Gestión de un Servidor de Correos Empresarial','MAIL-SERVE',1,NULL,NULL,'2026-05-04 00:00:00','2026-05-23 23:59:59',3,0,'#3b82f6','Proyecto para planificar e implementar un servidor de correos empresarial con Docker, Postfix, Dovecot y MariaDB.',500.00,0.00,1,0,'1','2,3,4',1,1)
ON DUPLICATE KEY UPDATE
`project_company`=VALUES(`project_company`),
`project_company_internal`=VALUES(`project_company_internal`),
`project_department`=VALUES(`project_department`),
`project_name`=VALUES(`project_name`),
`project_short_name`=VALUES(`project_short_name`),
`project_owner`=VALUES(`project_owner`),
`project_start_date`=VALUES(`project_start_date`),
`project_end_date`=VALUES(`project_end_date`),
`project_status`=VALUES(`project_status`),
`project_percent_complete`=VALUES(`project_percent_complete`),
`project_color_identifier`=VALUES(`project_color_identifier`),
`project_description`=VALUES(`project_description`),
`project_target_budget`=VALUES(`project_target_budget`),
`project_actual_budget`=VALUES(`project_actual_budget`),
`project_creator`=VALUES(`project_creator`),
`project_private`=VALUES(`project_private`),
`project_departments`=VALUES(`project_departments`),
`project_contacts`=VALUES(`project_contacts`),
`project_priority`=VALUES(`project_priority`),
`project_type`=VALUES(`project_type`);

-- =========================================================
-- 3) PLANIFICACIÓN / TAREAS
-- =========================================================

INSERT INTO `dotprojecttasks`
(`task_id`,`task_name`,`task_parent`,`task_milestone`,`task_project`,`task_owner`,`task_start_date`,`task_duration`,`task_duration_type`,`task_hours_worked`,`task_end_date`,`task_status`,`task_priority`,`task_percent_complete`,`task_description`,`task_target_budget`,`task_related_url`,`task_creator`,`task_order`,`task_client_publish`,`task_dynamic`,`task_access`,`task_notify`,`task_departments`,`task_contacts`,`task_custom`,`task_type`)
VALUES
(1,'Fase 1 - Análisis',0,0,1,1,'2026-05-04 08:00:00',4,1,0,'2026-05-07 17:00:00',0,1,0,'Análisis del problema empresarial, requerimientos y tecnologías.',0.00,NULL,1,1,0,0,0,0,'1',NULL,NULL,0),

(2,'1.1 Identificación del problema empresarial',1,0,1,4,'2026-05-04 08:00:00',1,1,0,'2026-05-04 17:00:00',0,1,0,'Detectar fallas en el uso de correos personales y riesgos de seguridad.',0.00,NULL,1,2,0,0,0,0,'1',NULL,NULL,0),
(3,'1.2 Definición de requerimientos',1,0,1,1,'2026-05-05 08:00:00',1,1,0,'2026-05-05 17:00:00',0,1,0,'Definir necesidades funcionales y no funcionales del servidor de correo.',0.00,NULL,1,3,0,0,0,0,'1',NULL,NULL,0),
(4,'1.3 Selección de tecnologías',1,0,1,2,'2026-05-05 08:00:00',1,1,0,'2026-05-06 17:00:00',0,1,0,'Seleccionar Docker, Postfix, Dovecot y MariaDB.',0.00,NULL,1,4,0,0,0,0,'1',NULL,NULL,0),
(5,'1.4 Análisis de seguridad',1,0,1,4,'2026-05-06 08:00:00',1,1,0,'2026-05-06 17:00:00',0,1,0,'Analizar control de acceso, contraseñas y protección de datos.',0.00,NULL,1,5,0,0,0,0,'1',NULL,NULL,0),
(6,'1.5 Documento de análisis',1,0,1,1,'2026-05-07 08:00:00',1,1,0,'2026-05-07 17:00:00',0,1,0,'Consolidar el análisis general del proyecto.',0.00,NULL,1,6,0,0,0,0,'1',NULL,NULL,0),

(7,'Fase 2 - Diseño',0,0,1,1,'2026-05-08 08:00:00',4,1,0,'2026-05-11 17:00:00',0,1,0,'Diseño de arquitectura, usuarios, buzones y seguridad.',0.00,NULL,1,7,0,0,0,0,'1',NULL,NULL,0),
(8,'2.1 Diseño de arquitectura del servidor',7,0,1,2,'2026-05-08 08:00:00',1,1,0,'2026-05-08 17:00:00',0,1,0,'Definir estructura Docker, Postfix, Dovecot y MariaDB.',0.00,NULL,1,8,0,0,0,0,'1',NULL,NULL,0),
(9,'2.2 Diseño de usuarios y buzones',7,0,1,3,'2026-05-09 08:00:00',1,1,0,'2026-05-09 17:00:00',0,1,0,'Definir cuentas empresariales y organización de buzones.',0.00,NULL,1,9,0,0,0,0,'1',NULL,NULL,0),
(10,'2.3 Diseño de seguridad',7,0,1,4,'2026-05-09 08:00:00',1,1,0,'2026-05-10 17:00:00',0,1,0,'Diseñar autenticación, permisos y restricciones de acceso.',0.00,NULL,1,10,0,0,0,0,'1',NULL,NULL,0),
(11,'2.4 Diseño de flujo de correo',7,0,1,2,'2026-05-10 08:00:00',1,1,0,'2026-05-10 17:00:00',0,1,0,'Definir cómo viaja el correo entre SMTP e IMAP/POP3.',0.00,NULL,1,11,0,0,0,0,'1',NULL,NULL,0),
(12,'2.5 Diagramas y documentación',7,0,1,1,'2026-05-11 08:00:00',1,1,0,'2026-05-11 17:00:00',0,1,0,'Crear diagramas y respaldos documentales del diseño.',0.00,NULL,1,12,0,0,0,0,'1',NULL,NULL,0),

(13,'Fase 3 - Planificación',0,0,1,1,'2026-05-12 08:00:00',3,1,0,'2026-05-14 17:00:00',0,1,0,'Cronograma, recursos y riesgos del proyecto.',0.00,NULL,1,13,0,0,0,0,'1',NULL,NULL,0),
(14,'3.1 Elaboración del cronograma',13,0,1,1,'2026-05-12 08:00:00',1,1,0,'2026-05-12 17:00:00',0,1,0,'Construir el Gantt con todas las fases y subtareas.',0.00,NULL,1,14,0,0,0,0,'1',NULL,NULL,0),
(15,'3.2 Asignación de recursos',13,0,1,2,'2026-05-13 08:00:00',1,1,0,'2026-05-13 17:00:00',0,1,0,'Asignar equipos, contenedores, base de datos y tiempo.',0.00,NULL,1,15,0,0,0,0,'1',NULL,NULL,0),
(16,'3.3 Gestión de riesgos',13,0,1,4,'2026-05-13 08:00:00',1,1,0,'2026-05-14 17:00:00',0,1,0,'Identificar riesgos técnicos y de seguridad.',0.00,NULL,1,16,0,0,0,0,'1',NULL,NULL,0),
(17,'3.4 Definición de tiempos',13,0,1,1,'2026-05-14 08:00:00',1,1,0,'2026-05-14 17:00:00',0,1,0,'Ajustar fechas y duración de la implementación.',0.00,NULL,1,17,0,0,0,0,'1',NULL,NULL,0),

(18,'Fase 4 - Implementación',0,0,1,1,'2026-05-15 08:00:00',6,1,0,'2026-05-20 17:00:00',0,1,0,'Implementación simulada del servidor de correos.',0.00,NULL,1,18,0,0,0,0,'1',NULL,NULL,0),
(19,'4.1 Instalación de Docker',18,0,1,2,'2026-05-15 08:00:00',1,1,0,'2026-05-15 17:00:00',0,1,0,'Preparar el entorno de contenedores.',0.00,NULL,1,19,0,0,0,0,'1',NULL,NULL,0),
(20,'4.2 Configuración de contenedores',18,0,1,2,'2026-05-15 08:00:00',1,1,0,'2026-05-16 17:00:00',0,1,0,'Levantar y enlazar los servicios del sistema.',0.00,NULL,1,20,0,0,0,0,'1',NULL,NULL,0),
(21,'4.3 Configuración de Postfix',18,0,1,3,'2026-05-16 08:00:00',1,1,0,'2026-05-16 17:00:00',0,1,0,'Configurar el servicio SMTP para envío de correos.',0.00,NULL,1,21,0,0,0,0,'1',NULL,NULL,0),
(22,'4.4 Configuración de Dovecot',18,0,1,3,'2026-05-17 08:00:00',1,1,0,'2026-05-17 17:00:00',0,1,0,'Configurar IMAP/POP3 para recepción de mensajes.',0.00,NULL,1,22,0,0,0,0,'1',NULL,NULL,0),
(23,'4.5 Configuración de MariaDB',18,0,1,2,'2026-05-17 08:00:00',1,1,0,'2026-05-18 17:00:00',0,1,0,'Preparar la base de datos de usuarios y buzones.',0.00,NULL,1,23,0,0,0,0,'1',NULL,NULL,0),
(24,'4.6 Configuración de seguridad',18,0,1,4,'2026-05-18 08:00:00',1,1,0,'2026-05-18 17:00:00',0,1,0,'Aplicar contraseñas, accesos y restricciones.',0.00,NULL,1,24,0,0,0,0,'1',NULL,NULL,0),
(25,'4.7 Pruebas funcionales',18,0,1,1,'2026-05-19 08:00:00',1,1,0,'2026-05-19 17:00:00',0,1,0,'Validar envío, recepción y autenticación.',0.00,NULL,1,25,0,0,0,0,'1',NULL,NULL,0),
(26,'4.8 Documentación técnica',18,0,1,1,'2026-05-20 08:00:00',1,1,0,'2026-05-20 17:00:00',0,1,0,'Redactar evidencia y soporte técnico del proyecto.',0.00,NULL,1,26,0,0,0,0,'1',NULL,NULL,0),

(27,'Fase 5 - Evaluación',0,0,1,1,'2026-05-21 08:00:00',3,1,0,'2026-05-23 17:00:00',0,1,0,'Evaluación de impacto, beneficios y costo-beneficio.',0.00,NULL,1,27,0,0,0,0,'1',NULL,NULL,0),
(28,'5.1 Evaluación del sistema',27,0,1,1,'2026-05-21 08:00:00',1,1,0,'2026-05-21 17:00:00',0,1,0,'Revisar el funcionamiento general del servidor.',0.00,NULL,1,28,0,0,0,0,'1',NULL,NULL,0),
(29,'5.2 Análisis de beneficios',27,0,1,3,'2026-05-22 08:00:00',1,1,0,'2026-05-22 17:00:00',0,1,0,'Medir mejoras en comunicación y seguridad.',0.00,NULL,1,29,0,0,0,0,'1',NULL,NULL,0),
(30,'5.3 Análisis costo-beneficio',27,0,1,2,'2026-05-22 08:00:00',1,1,0,'2026-05-23 17:00:00',0,1,0,'Comparar recursos invertidos con beneficios obtenidos.',0.00,NULL,1,30,0,0,0,0,'1',NULL,NULL,0),
(31,'5.4 Conclusiones finales',27,0,1,1,'2026-05-23 08:00:00',1,1,0,'2026-05-23 17:00:00',0,1,0,'Cerrar el proyecto con conclusiones y entrega final.',0.00,NULL,1,31,0,0,0,0,'1',NULL,NULL,0)
ON DUPLICATE KEY UPDATE
`task_name`=VALUES(`task_name`),
`task_parent`=VALUES(`task_parent`),
`task_milestone`=VALUES(`task_milestone`),
`task_project`=VALUES(`task_project`),
`task_owner`=VALUES(`task_owner`),
`task_start_date`=VALUES(`task_start_date`),
`task_duration`=VALUES(`task_duration`),
`task_duration_type`=VALUES(`task_duration_type`),
`task_hours_worked`=VALUES(`task_hours_worked`),
`task_end_date`=VALUES(`task_end_date`),
`task_status`=VALUES(`task_status`),
`task_priority`=VALUES(`task_priority`),
`task_percent_complete`=VALUES(`task_percent_complete`),
`task_description`=VALUES(`task_description`),
`task_target_budget`=VALUES(`task_target_budget`),
`task_related_url`=VALUES(`task_related_url`),
`task_creator`=VALUES(`task_creator`),
`task_order`=VALUES(`task_order`),
`task_client_publish`=VALUES(`task_client_publish`),
`task_dynamic`=VALUES(`task_dynamic`),
`task_access`=VALUES(`task_access`),
`task_notify`=VALUES(`task_notify`),
`task_departments`=VALUES(`task_departments`),
`task_contacts`=VALUES(`task_contacts`),
`task_custom`=VALUES(`task_custom`),
`task_type`=VALUES(`task_type`);

INSERT INTO `dotprojectuser_tasks`
(`user_id`,`user_type`,`task_id`,`perc_assignment`,`user_task_priority`)
VALUES
(1,0,1,100,1),
(4,0,2,100,1),
(1,0,3,100,1),
(2,0,4,100,1),
(4,0,5,100,1),
(1,0,6,100,1),
(1,0,7,100,1),
(2,0,8,100,1),
(3,0,9,100,1),
(4,0,10,100,1),
(2,0,11,100,1),
(1,0,12,100,1),
(1,0,13,100,1),
(1,0,14,100,1),
(2,0,15,100,1),
(4,0,16,100,1),
(1,0,17,100,1),
(1,0,18,100,1),
(2,0,19,100,1),
(2,0,20,100,1),
(3,0,21,100,1),
(3,0,22,100,1),
(2,0,23,100,1),
(4,0,24,100,1),
(1,0,25,100,1),
(1,0,26,100,1),
(1,0,27,100,1),
(1,0,28,100,1),
(3,0,29,100,1),
(2,0,30,100,1),
(1,0,31,100,1)
ON DUPLICATE KEY UPDATE
`user_type`=VALUES(`user_type`),
`perc_assignment`=VALUES(`perc_assignment`),
`user_task_priority`=VALUES(`user_task_priority`);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
