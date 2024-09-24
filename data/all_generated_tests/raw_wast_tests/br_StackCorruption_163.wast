;; 4. **Test Description:**    Use a `br` where the target label's input types mismatch the operand types on the stack at the branch point.    **Constraint Checked:** Verification of type consistency during stack unwinding.    **Relation to Stack Corruption:** Type mismatches could lead to corrupted data being left on the stack after branching.

(assert_invalid
  (module (func $test
    (block (result i32)
      (br 0 (i64.const 1))
    )
  ))
  "type mismatch"
)