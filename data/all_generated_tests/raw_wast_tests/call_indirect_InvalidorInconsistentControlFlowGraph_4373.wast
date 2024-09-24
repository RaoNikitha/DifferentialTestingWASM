;; 2. **Invalid Function Type Signature**: Define a function with a certain type signature in the table but invoke it through `call_indirect` expecting a different, incompatible type signature.    - **Constraint**: Type mismatch between expected and actual function signature.    - **CFG Relation**: Checks for correct CFG interpretation when function type mismatches occur, ensuring traps are executed correctly.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (call_indirect (type 1) (i32.const 0) (i32.const 42)))
  )
  "type mismatch"
)