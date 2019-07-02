DELETE FROM departments;

DECLARE
  e_fk_err EXCEPTION;
  PRAGMA exception_init(e_fk_err, -02292);
BEGIN
  DELETE FROM departments;
  EXCEPTION
  WHEN e_fk_err THEN
    RAISE_APPLICATION_ERROR(-20001, 'error');
END;




DECLARE
  e_fk_err EXCEPTION;
  PRAGMA exception_init(e_fk_err, -02292);
BEGIN
  DELETE FROM departments;
  EXCEPTION
  WHEN e_fk_err THEN
    RAISE_APPLICATION_ERROR(-20001, 'error', TRUE);
END;
