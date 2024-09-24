;; 6. **Test Name**: `if` Instruction with Mis-matched Start and End Types    **Description**: Create an `if` block where the entry criterion (`i32`) and its processing do not match the resulting stack operations within `then` or `else` blocks.    **Constraints Checked**: Valid evaluation of `if` condition type.    **CFG Issue**: Checks correct type propagation and stack validation through the CFG.

(assert_invalid
  (module (func $mismatched-start-end-types (result i32)
    (if (result i32) (i32.const 1)
      (then (f64.const 0.0) (drop))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)