;; 3. **Inconsistent Operand Stack Unwinding:**    Design a `br_table` within a nested control structure where unwinding the stack for the branch leads to mismatched operand types. By branching outward where operand types diverge, this checks proper unwinding and type consistency checks.

(assert_invalid
  (module
    (func $stack-unwinding-mismatch
      (block (result i32)
        (block
          (i32.const 1)
          (block (br_table 0 1 (i32.const 0)))
        )
      )
    )
  )
  "type mismatch"
)