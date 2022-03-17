DELIMITER $$

CREATE TRIGGER details_insert
AFTER INSERT
ON order_details FOR EACH ROW
BEGIN
    IF NEW.thanhtien IS NOT NULL THEN
        update orders 
        set tongtien = tongtien+ NEW.thanhtien
        where maDH = NEW.maDH;
    END IF;
END$$

DELIMITER ;

CREATE EVENT myevent
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 10 second
    DO
      insert into order_details values ('CTSP013', '1', '30000', '30000', 'MD001', 'SP001'
);