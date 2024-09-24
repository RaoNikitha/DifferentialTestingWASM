;; 1. **Test Description**:    - Check if a `call_indirect` instruction with a type index that expects an integer parameter calls a function that returns a float. This should result in a trap due to a type mismatch when the function type is dynamically resolved at runtime.    - **Constraint Being Checked**:      - Ensuring dynamic type checking correctly enforces the return type constraints specified by `typeidx`.    - **Relation to Control Flow Instructions**:      - This verifies that control flow correctly identifies type mismatches at the point of return from the indirect call, consistent with the function type signature.

(assert_invalid
  (module
    (func $f (result f32))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $type-mismatch-on-return
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)