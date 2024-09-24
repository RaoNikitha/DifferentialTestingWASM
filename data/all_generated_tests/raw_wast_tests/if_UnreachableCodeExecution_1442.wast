;; 3. Test with nested `if` blocks where the inner `if` contains an `unreachable` instruction in the true branch. This checks for correct nested control flow and proper handling of unreachable code in both implementations.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          (i32.const 1)          if (result i32)            unreachable            (i32.const 2)          else            (i32.const 3)          end        else          (i32.const 4)        end      )    )    ```    Constraint: Inner `if` with `unreachable` to test control flow.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      if (result i32)
        (i32.const 1)
        if (result i32)
          unreachable
          (i32.const 2)
        else
          (i32.const 3)
        end
      else
        (i32.const 4)
      end
    )
  )
  "type mismatch"
)