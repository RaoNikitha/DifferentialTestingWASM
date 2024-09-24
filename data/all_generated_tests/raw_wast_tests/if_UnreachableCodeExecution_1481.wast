;; 2. **Unreachable Inside Else Block**:    Create a test where the `else` block has an `unreachable` instruction followed by normal instructions. This examines the correct bypassing of the `unreachable` when the `if` condition is true.    ```    if (i32.const 1) i32.const 1 else i32.const 2 unreachable i32.const 3 end    ```

(assert_invalid
  (module
    (func $unreachable-in-else
      (if (result i32)
          (i32.const 1)
        (else
          (i32.const 2)
          unreachable
          (i32.const 3)
        )
      )
    )
  )
  "unreachable executed"
)