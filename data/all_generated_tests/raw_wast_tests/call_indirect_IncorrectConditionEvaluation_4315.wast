;; 4. **Type Mismatch with Valid Index**:    - Place a valid function at an index but with a type that mismatches the expected `typeidx`.    - Test to see if the OCaml implementation traps correctly on a pattern match failure while the Java code might check signatures improperly.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param f64)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param f64) (drop (local.get 0)))
    (func $test (call_indirect (type 0) (i32.const 0) (i32.const 1)))
  )
  "type mismatch"
)