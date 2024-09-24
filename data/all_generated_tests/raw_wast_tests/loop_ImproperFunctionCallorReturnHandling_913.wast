;; 4. **Test: Loop with Early Return from Function**     - Description: Create a loop instruction containing a function call where the function has an early `return` statement based on a condition. Verify that the loop correctly handles the premature function return and continues execution.     - Constraint: Validates handling of early returns within a function called from inside a loop, ensuring proper control flow.

(assert_invalid
  (module
    (func $early_return (result i32)
      local.get 0
      i32.const 1
      i32.eq
      if (result i32)
        i32.const 42
        return
      end
      i32.const 0
    )
    (func (param i32) (result i32)
      loop (param i32) (result i32)
        call $early_return
        br_if 0
      end
    )
  )
  "type mismatch"
)