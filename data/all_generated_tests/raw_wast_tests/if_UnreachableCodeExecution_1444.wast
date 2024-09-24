;; 5. Test an `if` block where both `then` and `else` branches start with an unreachable instruction but follow different primary values. This checks if the control flow maintains correctness, particularly in implementations handling such edge cases.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          unreachable          (i32.const 2)        else          unreachable          (i32.const 3)        end      )    )    ```    Constraint: Unreachable paths in both branches.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      if (result i32)
        unreachable
        (i32.const 2)
      else
        unreachable
        (i32.const 3)
      end
    )
  )
  "unreachable"
)