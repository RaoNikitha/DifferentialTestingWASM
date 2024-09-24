;; 6. **Test Description**: Design a block with a `call_indirect` instruction that targets a signature mismatched function type.    - **Constraint**: Validate that indirect function calls match expected function signatures.    - **CFG Relation**: Ensures the CFG correctly reflects function type and signature requirements for indirect calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result f64)))
    (func $test
      (block (call_indirect (type $sig) (i32.const 0) (i64.const 10)))
    )
  )
  "type mismatch"
)