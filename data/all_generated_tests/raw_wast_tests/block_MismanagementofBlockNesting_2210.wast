;; 1. **Nested Block with Unsatisfied Result Types**:    Test a nested block structure where the inner block leaves an operand type on the stack that differs from what the outer block expects. This checks the handling of stack consistency when exiting nested blocks.

(assert_invalid
  (module (func $nested-blocks-type-mismatch
    (block (result i32) 
      (block (result f64)
        (f64.const 1.0)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)