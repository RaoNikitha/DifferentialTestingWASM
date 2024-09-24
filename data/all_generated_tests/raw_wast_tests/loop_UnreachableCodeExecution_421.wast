;; 2. **Test Description 2**: Implement a loop containing a nested `if-else` block where the `else` branch has an `unreachable` instruction. Incorrect validation of branch instructions within the nested structure should cause execution to reach the `unreachable` instruction if the branch handling is faulty.

(assert_invalid
  (module (func
    (i32.const 0)
    (loop (result i32)
      (if (result i32) (i32.const 1) (else (unreachable))
      )
    )
  ))
  "type mismatch"
)