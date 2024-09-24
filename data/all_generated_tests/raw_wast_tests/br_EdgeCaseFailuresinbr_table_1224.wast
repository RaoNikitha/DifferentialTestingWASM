;; 5. **Mismatch of Indices and Operand Stack:**    - Description: Create a `br_table` where some indices require additional operand stack values while others do not.    - Assess whether the implementation can dynamically manage stack requirements based on the selected label.    - Specific Constraint: Check stack polymorphism by observing how different branches handle stack unwinding.

(assert_invalid
  (module
    (func $mismatch-indices-operand-stack
      (block (result i32)
        (block (result i64)
          (br_table 0 1 (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)