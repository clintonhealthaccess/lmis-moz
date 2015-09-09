DELETE FROM patient_quantification_line_items;
DELETE FROM requisition_line_item_losses_adjustments;

DELETE FROM regimen_line_items;
DELETE FROM regimens;
DELETE FROM regimen_categories;
DELETE FROM program_regimen_columns;

DELETE FROM requisition_line_items;
DELETE FROM requisition_status_changes;
DELETE FROM requisitions;

DELETE FROM program_regimen_columns;
DELETE FROM regimens;

DELETE FROM requisition_group_program_schedules;
DELETE FROM requisition_group_members;
DELETE FROM requisition_groups;
DELETE FROM supervisory_nodes;

DELETE FROM processing_periods;
DELETE FROM processing_schedules;

DELETE FROM program_rnr_columns;

DELETE FROM role_assignments WHERE roleid IN (SELECT id FROM roles WHERE name IN ('FacilityHead','Store In-Charge'));
DELETE FROM users WHERE username != 'Admin123';
DELETE FROM role_rights WHERE roleid IN (SELECT id FROM roles WHERE name IN ('FacilityHead', 'Store In-Charge')) ;
DELETE FROM role_rights WHERE roleid= (SELECT id FROM roles WHERE name = 'Admin')
   AND rightName IN ('MANAGE_GEOGRAPHIC_ZONE','MANAGE_SUPERVISORY_NODE','MANAGE_REQUISITION_GROUP','MANAGE_FACILITY_APPROVED_PRODUCT','MANAGE_PRODUCT');
DELETE FROM roles WHERE name IN ('FacilityHead', 'Store In-Charge');

DELETE FROM facility_approved_products;
DELETE FROM program_products;
DELETE FROM products;
DELETE FROM product_groups;
DELETE FROM product_categories;
DELETE FROM dosage_units;

DELETE FROM programs_supported;
DELETE FROM facilities;
DELETE FROM refrigerators;
DELETE FROM facility_types;

DELETE FROM geographic_zones;
DELETE FROM geographic_levels;

DELETE FROM programs;

