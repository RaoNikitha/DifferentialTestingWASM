;; 4. **Incorrectly Typed Loop Parameters:**    - Include a `br` targeting a loop block with incorrectly typed loop parameters.    - **Constraint Checked:** Operand types matching loop parameters.    - **CFG Impact:** This would create paths with parameters that do not match expected loop types, disrupting valid CFG paths.

(assert_invalid
  (module
    (func $incorrectly-typed-loop-parameters
      (loop (param i32) (result i32)
        (i64.const 10)
        (br 0)
      )
    )
  )
  "type mismatch"
)