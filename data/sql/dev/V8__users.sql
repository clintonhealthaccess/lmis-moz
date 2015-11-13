INSERT INTO rights (name, rightType, description) VALUES
('VIEW_REQUISITION_REPORT','REPORT','Permission to View Requisitions Report');

INSERT INTO roles
(name, description) VALUES
('FacilityHead', ''),
('ReportViewer', '');

INSERT INTO role_rights
(roleId, rightName) VALUES
((SELECT id FROM roles WHERE name = 'FacilityHead'), 'AUTHORIZE_REQUISITION'),
((SELECT id FROM roles WHERE name = 'FacilityHead'), 'VIEW_REQUISITION'),
((SELECT id FROM roles WHERE name = 'FacilityHead'), 'CREATE_REQUISITION'),
((SELECT id FROM roles WHERE name = 'ReportViewer'), 'VIEW_REQUISITION_REPORT'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_GEOGRAPHIC_ZONE'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_SUPERVISORY_NODE'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_REQUISITION_GROUP'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_FACILITY_APPROVED_PRODUCT'),
((SELECT id FROM roles WHERE name = 'Admin'), 'MANAGE_PRODUCT');

INSERT INTO users
(userName, password, facilityId, firstName, lastName, email, verified, active, restrictLogin, isMobileUser) VALUES
('superuser', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'HF5'), 'Super', 'User', NULL,
  TRUE, TRUE, FALSE, TRUE),
('professor_x', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'DDM1'), 'Charles', 'Xavier', 'openlmis.test.ddm@gmail.com',
  TRUE, TRUE, FALSE, TRUE),
('magneto', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'DPS1'), 'Eric', 'Lensherr', 'openlmis.test.dpm@gmail.com',
  TRUE, TRUE, FALSE, TRUE),
('mystique', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'HF2'), 'Raven', 'Darkholme', NULL,
  TRUE, TRUE, FALSE, TRUE),
('wolverine', 'vFR3ULknlislVs2ESzJvdXN330IYhUdA6FnraiiZWqJKmtJGELNqaLwC2iiQUHuUWcK6hPtZGkJmkRT8zXLI5212gieie',
  (SELECT id FROM facilities WHERE code = 'HF3'), 'Logan', 'H', NULL,
  TRUE, TRUE, FALSE, TRUE);

INSERT INTO role_assignments
(userId, roleId, programId, supervisoryNodeId) VALUES
((SELECT ID FROM USERS WHERE username = 'superuser'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'superuser'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'mystique'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'mystique'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'wolverine'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'MMIA'), NULL),
((SELECT ID FROM USERS WHERE username = 'wolverine'),
  (SELECT id FROM roles WHERE name = 'FacilityHead'), (SELECT id FROM programs WHERE code = 'ESS_MEDS'), NULL),
((SELECT ID FROM USERS WHERE username = 'professor_x'),
  (SELECT id FROM roles WHERE name = 'ReportViewer'), NULL, NULL),
((SELECT ID FROM USERS WHERE username = 'magneto'),
  (SELECT id FROM roles WHERE name = 'ReportViewer'), NULL, NULL);