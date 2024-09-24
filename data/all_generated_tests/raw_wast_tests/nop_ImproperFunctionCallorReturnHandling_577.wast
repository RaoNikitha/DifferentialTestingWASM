;; 8. **Test Description**: Implement a function that uses `nop` instructions interleaved with `call_indirect` and `call` instructions. Verify the function selectors are correct, and indirect calls resolve to valid functions.    - **Constraint Checked**: Validates correct indirect call target selection.    - **Relation to Improper Handling**: `Nop` mishandling can result in incorrect function resolution.

(assert_invalid
  (module
    (table 1 funcref)
    (type $type-v (func))
    (func $targetFunc (nop))
    (func (result i32)
      (nop)
      (call $targetFunc)
      (nop)
      (call_indirect (type $type-v) (i32.const 0))
      (nop)))
  "type mismatch"
)