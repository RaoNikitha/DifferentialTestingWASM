;; 4. Test an `if` block with an unreachable instruction immediately after the condition evaluation, checking if both implementations respect the immediate trap.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          unreachable          (i32.const 2)        else          (i32.const 3)        end      )    )    ```    Constraint: Immediate trap on if condition met.

(assert_invalid
  (module (func (result i32)
    (i32.const 1)
    if (result i32)
      unreachable
      (i32.const 2)
    else
      (i32.const 3)
    end
  ))
  "unreachable instruction trap"
)