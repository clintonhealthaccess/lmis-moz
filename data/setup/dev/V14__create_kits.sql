INSERT INTO product_forms (code, displayOrder) VALUES ('Sem',72);

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId) values
('08L01X', 'Agua para Injectavel', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '5ml', (SELECT id from product_forms where code='Embalagem')),
('12D0YZ', 'Complexo B+Vitamina C', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '0,2%', (SELECT id from product_forms where code='Papel')),
('15C0ZY', 'Benzoato de benzilo', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '0,2%', (SELECT id from product_forms where code='Embalagem')),
('20A05', 'Cetrimida+Clorexidina', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '15 g + 1,5 g/100mL', (SELECT id from product_forms where code='Papel')),
('MMC00001', 'Folheto, Mocambique Kit US & APE piece', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')),
('MMC00002', 'Luvas de examinacao, Latex, medium ligeiramente polvilhadas', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')),
('MMC00003', 'Poliamida 3/0, agulha curva 3/8 circlo,26 mm triangular', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')),
('MMC00004', 'Caixa de incineracao para agulhas/seringas usadas,inflamavel, 5L', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem')),
('MMC00005', 'Sabao', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '110g', (SELECT id from product_forms where code='Sem')),
('MMC00006', 'Seringa descartavel, 10ml c/agulha 21gx1 1/2 3', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, 'SEM DOSAGEM', (SELECT id from product_forms where code='Sem'));

INSERT INTO program_products (programId, productId, fullSupply, active, dosesPerMonth, productCategoryId, currentPrice, displayOrder) VALUES
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '08L01X'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '12D0YZ'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '15C0ZY'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = '20A05'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00001'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00002'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00003'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00004'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00005'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14),
((SELECT id FROM programs WHERE code = 'ESS_MEDS'), (SELECT id FROM products WHERE code = 'MMC00006'), TRUE, TRUE,12.5, (SELECT id FROM product_categories where code = 'C1'), 0.0,  14);

INSERT INTO products (code, primaryName, dispensingUnit, dosesPerDispensingUnit, packSize, active, fullSupply, tracer, packRoundingThreshold, roundToZero, strength, formId, isKit) values
('SCOD10', 'KITS  (DE PME US)', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '1000', (SELECT id from product_forms where code='KIT'), TRUE),
('SCOD12', 'KITS  (DE PME APE)', '1', 1,1,TRUE,TRUE,FALSE,0,FALSE, '250', (SELECT id from product_forms where code='KIT'), TRUE);

INSERT INTO kit_products_relation (kitId, productId, quantity) values
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='02A03'), 200),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='02E02'), 25),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='04B05'), 40),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='05A01'), 500),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='05A09'), 400),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='06A07'), 5000),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='07A02'), 1000),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='07A03'), 5000),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='07A06'), 20),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='07I07'), 5),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08A01'), 1500),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08A06'), 25),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08A08'), 60),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08F06'), 500),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08G01'), 300),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08H01'), 400),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08I01'), 4000),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08I03'), 50),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08K04'), 2000),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08L01X'), 200),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08N01Z'), 150),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08N06'), 30),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='08Q07'), 10),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='10A07'), 75),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='11A23'), 250),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='12D0YZ'), 25),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='13A01'), 5),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='13A02'), 500),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='14A03'), 800),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='15C08'), 5),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='15C0ZY'), 10),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='18C06'), 1),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='20A05'), 2),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='23A02Y'), 8),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='23B01'), 6),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='23C01'), 40),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='23D05'), 96),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='26B03'), 2500),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='MMC00001'), 1),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='MMC00002'), 100),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='MMC00003'), 10),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='MMC00004'), 1),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='MMC00005'), 3),
((SELECT id from products where code='SCOD10'), (SELECT id from products where code='MMC00006'), 75);
