;; 5. **Test Description**:    - Use a `call_indirect` instruction to call a function with a signature having more parameters than the function it points to in the table.    - **Constraint**: Ensures dynamic type checking of parameter count.    - **CFG Relation**: CFG should identify mismatched parameter count leading to trap paths diverging from normal execution paths.

(assert_invalid
  (module
    (type $expected (func (param i32 i32)))
    (type $actual (func (param i32)))
    (table funcref (elem 0 (type $actual)))
    (func $test (param i32 i32)
      (call_indirect (type $expected) (local.get 0)))
  )
  "type mismatch"
)