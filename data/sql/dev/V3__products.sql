INSERT INTO dosage_units
(code, displayOrder) VALUES
('mg',1),
('ml',2),
('each',3),
('cc',4),
('gm',5),
('mcg',6),
('IU',7);

INSERT INTO product_categories
(code, name , displayOrder) VALUES
('C1', 'Antibiotics', 1),
('C2', 'Anaesthetics', 4),
('C3', 'Anti-fungal', 2),
('C4', 'Analgesics', 2),
('C5', 'Vaccines', 2);

INSERT INTO products
(code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer,
  packRoundingThreshold, roundToZero, strength) values
('P1', 'Acetylsalicylic Acid, tablet 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P2', 'Acyclovir, tablet 400mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P3', 'Aminophylline Injection 250mg/10ml', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P4', 'Amoxicillin (Trihydrate), Dry powder for suspension 125mg/5ml', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('P5', 'Atenolol 50mg tab', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S42', 'Lamivudina 150mg/Zidovudina 300mg/Nevirapina 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S18Y', 'Tenofovir 300mg/Lamivudina 300mg/Efavirenze 600mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S40', 'Lamivudina 150mg/ Zidovudina 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S36', 'Lamivudina 150mg/Stavudina 30mg/Nevirapina 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S32', 'Lamivudina 150mg/Stavudina 30mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S18Z', 'Tenofovir 300mg/Lamivudina 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S39Z', 'Lopinavir/Ritonavir 200mg/50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S21', 'Efavirenze (EFV) 600mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S01', 'Abacavir (ABC) 300 mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S22', 'Nevirapina (NVP) 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S13', 'Lamivudina (3TC) 150mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S15', 'Zidovudina (AZT) 300mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S34b', 'Lamivudina 30mg/Stavudina 6mg/Nevirapina 50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S32Z', 'Estavudina/Lamivudina 6mg+30mg, 60 Comp (Baby) Embalagem', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S42B', 'Lamivudina 30mg/Zidovudina 60mg/Nevirapina 50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S40Z', 'Lamivudina 30mg/ Zidovudina 60mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S39B', 'Lopinavir/Ritonavir 100mg/25mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S39Y', 'Lopinavir/Ritonavir 80/20 ml Solução Oral', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S01ZZ', 'Abacavir 60mg/ Lamivudina 30mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S20', 'Efavirenze (EFV) 200mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S19', 'Efavirenze (EFV) 50mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S01B', 'Abacavir (ABC) 60mg', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S23', 'Nevirapina 50mg/5ml Sol Oral', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg'),
('08S17', 'Zidovudina 50mg/5ml Sol Oral', 'Strip', 10, 10, TRUE, TRUE, FALSE, 1, FALSE, '10mg');

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, displayOrder) VALUES
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P1'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 1),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P2'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 2),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P3'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 3),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P4'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 4),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'P5'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 5),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S42'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 6),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S18Y'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 7),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S40'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 8),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S36'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 9),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S32'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 10),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S18Z'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 11),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S39Z'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 12),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S21'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 13),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S01'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 14),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S22'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 15),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S13'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 16),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S15'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 17),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S34b'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 18),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S32Z'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 19),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S42B'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 20),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S40Z'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 21),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S39B'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 22),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S39Y'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 23),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S01ZZ'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 24),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S20'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 25),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S19'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 26),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S01B'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 27),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S23'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 28),
((SELECT id FROM programs WHERE code = 'MMIA'), (SELECT id FROM products WHERE code = '08S17'),
  TRUE, TRUE, 12.5, (SELECT id FROM product_categories where code = 'C1'), 29);

INSERT INTO facility_approved_products (facilityTypeId, programProductId, maxMonthsOfStock) VALUES
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P1')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P2')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P3')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P4')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P5')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S42')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S18Y')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S40')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S36')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S32')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S18Z')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S39Z')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S21')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S01')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S22')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S13')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S15')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S34b')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S32Z')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S42B')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S40Z')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S39B')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S39Y')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S01ZZ')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S20')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S19')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S01B')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S23')), 3),
((SELECT id FROM facility_types WHERE code = 'health_facility'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S17')), 3),
((SELECT id FROM facility_types WHERE code = 'ddm'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P1')), 3),
((SELECT id FROM facility_types WHERE code = 'ddm'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P2')), 3),
((SELECT id FROM facility_types WHERE code = 'ddm'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P3')), 3),
((SELECT id FROM facility_types WHERE code = 'ddm'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P4')), 3),
((SELECT id FROM facility_types WHERE code = 'ddm'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = 'P5')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S42')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S18Y')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S40')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S36')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S32')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S18Z')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S39Z')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S21')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S01')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S22')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S13')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S15')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S34b')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S32Z')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S42B')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S40Z')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S39B')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S39Y')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S01ZZ')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S20')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S19')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S01B')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S23')), 3),
((SELECT id FROM facility_types WHERE code = 'dps'),
  (SELECT id FROM program_products WHERE productId = (SELECT id FROM products WHERE code = '08S17')), 3);
