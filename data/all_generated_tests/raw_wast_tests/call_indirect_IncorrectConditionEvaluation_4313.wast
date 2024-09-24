;; 2. **Boundary Condition with Extra Parameters**:    - Create functions with extra parameters in the table than the expected type.    - Call such a function using `call_indirect`.    - Verify if the OCaml implementation traps on pattern match, whereas the Java approach might incorrectly check with helper methods.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem 0))
    (func $extra-params (param i32 i32))
    (func $call (call_indirect (type 0) (i32.const 0) (i32.const 0) (i32.const 1)))
  )
  "type mismatch"
)