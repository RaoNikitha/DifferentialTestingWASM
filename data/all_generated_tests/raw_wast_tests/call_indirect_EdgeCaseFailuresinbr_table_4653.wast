;; 2. **Nested Call Indirect**:    - Test a `call_indirect` instruction that calls another `call_indirect` instruction. The chain should match the specified function types at each level.    - This test checks whether nested function calls conform to stack operations and dynamic type checks.    - It relates to `br_table` by ensuring complex operand dependencies and nested branching are handled correctly.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (result i32)))
    (func $inner (param i32) (result i32)
      (call_indirect (type $sig2) (i32.const 0)))
    (table funcref (elem $inner))
    (func (param i32) (result i32)
      (call_indirect (type $sig1) (param i32) (i32.const 0)))
  )
  "type mismatch"
)