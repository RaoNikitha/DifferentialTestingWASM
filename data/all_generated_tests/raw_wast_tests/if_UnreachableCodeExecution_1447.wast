;; 8. Test a sequence where an `if` block is followed by another instruction after the `end`, with the `if` block containing an unreachable instruction. This will verify if the control flows correctly return to post-if execution.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          unreachable          (i32.const 2)        else          (i32.const 3)        end        (i32.const 4)      )    )    ```    Constraint: Proper flow transition after if/else with unreachable.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        unreachable
        (i32.const 2)
      else
        (i32.const 3)
      end)
      (i32.const 4)
    )
  )
  "type mismatch"
)