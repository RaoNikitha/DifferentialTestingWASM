;; 1. Test an `if` block that includes an `unreachable` instruction within the `then` branch, with the condition set to true. This ensures the block correctly traps in WebAssembly and wizard_engine doesn't bypass the `unreachable` instruction.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          unreachable          (i32.const 2)        else          (i32.const 3)        end      )    )    ```    Constraint: Execution hits `unreachable`, leading to trap.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      if (result i32)
        unreachable
        (i32.const 2)
      else
        (i32.const 3)
      end
    )
  )
  "unreachable code"
)