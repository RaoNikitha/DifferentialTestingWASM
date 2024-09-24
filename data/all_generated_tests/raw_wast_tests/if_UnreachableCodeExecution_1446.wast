;; 7. Test an `if` block nested within another if block with different conditions, containing `unreachable` instructions in various configurations to stress test the proper handling of nested control logic.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          (i32.const 0)          if (result i32)            unreachable            (i32.const 2)          else            (i32.const 3)            unreachable          end        else          (i32.const 4)        end      )    )    ```    Constraint: Multiple nested if with unreachable paths.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      if (result i32)
        (i32.const 0)
        if (result i32)
          unreachable
          (i32.const 2)
        else
          (i32.const 3)
          unreachable
        end
      else
        (i32.const 4)
      end
    )
  )
  "type mismatch"
)