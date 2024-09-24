;; 2. Test an `if` block with a false condition where the `else` part includes an `unreachable` instruction. The test verifies that WebAssembly correctly bypasses the `unreachable` instruction while the wizard_engine does not erroneously execute it.    ```    (module      (func (result i32)        (i32.const 0)        if (result i32)          (i32.const 2)        else          unreachable          (i32.const 3)        end      )    )    ```    Constraint: Bypass `unreachable` on false condition test.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      if (result i32)
        (i32.const 2)
      else
        unreachable
        (i32.const 3)
      end
    )
  )
  "unreachable code"
)