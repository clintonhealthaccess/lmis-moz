-- the following function will return the last soh in the key value table of a specified stockcard
CREATE OR REPLACE FUNCTION last_movement_soh_of_stockcard(stockcard_id INTEGER)
  RETURNS TEXT AS $last_soh$
DECLARE
  soh TEXT;
BEGIN
  SELECT
    valuecolumn,
    stock_card_entry_key_values.createddate
  FROM stock_card_entry_key_values
    JOIN stock_card_entries ON stock_card_entry_key_values.stockcardentryid = stock_card_entries.id
  WHERE stock_card_entries.stockcardid = stockcard_id AND keycolumn = 'soh'
  ORDER BY stockcardentryid DESC
  LIMIT 1
  INTO soh;
  RETURN soh;
END;
$last_soh$ LANGUAGE plpgsql;

-- the following sql statement will return stockcards whose soh mismatch the soh in the key value table
SELECT
  stock_cards.id                                 AS cardid,
  facilities.name,
  products.primaryname,
  products.code,
  totalquantityonhand                            AS cardsoh,
  last_movement_soh_of_stockcard(stock_cards.id) AS kvsoh
FROM stock_cards
  JOIN products ON stock_cards.productid = products.id
  JOIN facilities ON stock_cards.facilityid = facilities.id
WHERE totalquantityonhand != cast(last_movement_soh_of_stockcard(stock_cards.id) AS INTEGER);

-- Lot's data integrity check
SELECT sc.id, t1.lohstockcardid, t2.scestockcardid FROM stock_cards sc
JOIN
  (SELECT lots_on_hand.stockcardid AS lohstockcardid, lots_on_hand.id AS lohid, lots_on_hand.quantityonhand AS lohquantityonhand,
    lots_on_hand.lotid AS lohlotid, lots.id AS lotid
  FROM lots_on_hand JOIN lots ON lots_on_hand.lotid=lots.id) t1 ON sc.id=t1.lohstockcardid
JOIN
  (SELECT stock_card_entries.id AS sceid, stock_card_entries.stockcardid AS scestockcardid,
    stock_card_entry_key_values.stockcardentryid AS scekvstockcardentryid,
    stock_card_entry_key_values.keycolumn AS scekvkeycolumn,
    stock_card_entry_key_values.valuecolumn AS scekvvaluecolumn FROM stock_card_entries JOIN stock_card_entry_key_values
    ON stock_card_entries.id= stock_card_entry_key_values.stockcardentryid) t2 ON sc.id=t2.scestockcardid
WHERE t2.scekvkeycolumn LIKE 'cast(t1.lotid AS VARCHAR)' AND t1.lohquantityonhand != cast(t2.scekvvaluecolumn AS INTEGER);

--Lot integrity check
SELECT sc.productid, t1.lotproductid, t1.lotid, t1.lotnumber, sc.id, t1.lotonhandid
FROM stock_cards sc
JOIN
(SELECT lots.productid AS lotproductid, lots.id AS lotid, lots.lotnumber AS lotnumber,
    lots_on_hand.stockcardid AS loh_sc, lots_on_hand.id AS lotonhandid
    FROM lots JOIN lots_on_hand ON lots_on_hand.lotid = lots.id) t1
ON sc.id = t1.loh_sc
WHERE sc.productid != t1.lotproductid
ORDER BY t1.lotonhandid;

--Data integrity check of the consistencgy of Consumption view and CMM in cmm_entries
--SELECT DISTINCT ce.productcode,ce.facilityid,ce.periodend,ce.cmmvalue,facilities.name, t1.vwcmm FROM cmm_entries ce
--JOIN facilities ON ce.facilityid=facilities.id
--JOIN (SELECT vwpm.periodend AS vwperiodend,vwpm.cmm AS vwcmm,vwpm.drug_code AS vwdrugcode,
--  vwpm.facility_name AS vwfacilityname, facilities.id AS facilityid
--  FROM vw_period_movements vwpm
--  JOIN facilities ON vwpm.facility_name=facilities.name) t1 ON t1.facilityid=ce.facilityid
--  WHERE ce.productcode=t1.vwdrugcode AND ce.periodend::DATE=t1.vwperiodend::DATE AND ce.cmmvalue!=t1.vwcmm;
