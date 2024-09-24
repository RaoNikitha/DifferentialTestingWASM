;; 6. Test an `if` block within a loop where the `if` contains an `unreachable` instruction. The loop's structure checks the correct trapping when a condition is always true within repetitive execution.    ```    (module      (func (result i32)        loop (result i32)          (i32.const 1)          if (result i32)            unreachable            (i32.const 2)          else            (i32.const 3)          end        end      )    )    ```    Constraint: Loop structure containing unreachable if.

(assert_invalid
  (module
    (func (result i32)
      loop (result i32)
        (i32.const 1)
        if (result i32)
          unreachable
          (i32.const 2)
        else
          (i32.const 3)
        end
      end
    )
  )
  "unreachable in block"
)