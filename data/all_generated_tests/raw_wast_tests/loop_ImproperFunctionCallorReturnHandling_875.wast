;; 6. **Test Description**: Using a `loop` that includes a `call_indirect` where the called function returns a function reference to be further called within the loop.    - **Constraint**: Tests for correct handling of functions returning function references and subsequent calls within the loop.    - **Improper Handling**: Mismanagement of function references leading to incorrect or unintended subsequent function calls. -

(assert_invalid
  (module
    (type $sig (func (result funcref)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result funcref)
      (ref.func $g)) 
    (func $g)
    (func (loop (call_indirect (type $sig)
                    (i32.const 0)) 
                (call (ref.func $f)))
      (drop)))
  "type mismatch"
)