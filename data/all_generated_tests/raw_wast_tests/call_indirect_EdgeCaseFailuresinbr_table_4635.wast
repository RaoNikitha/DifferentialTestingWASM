;; 4. **Test for Misaligned Function Signatures in `call_indirect` After Valid `br_table`**:    - Use `br_table` to branch correctly, then call a function with `call_indirect` where the expected and actual function signatures in the table mismatch.    - Constraint: Type mismatch between expected and actual function.    - Relation: Validates signature conformity and mismatch trapping post branching.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (param i32) (result i32) (local.get 0))
    (func $test
      (block (br_table 0 (i32.const 0)))
      (call_indirect (type $sig2) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)