;; - **Test Description 2**: An `if` instruction where the condition is dynamically calculated but intended to evaluate to false (e.g., `i32.const 5, i32.const 5, i32.eq`). Ensure the implementation skips the `then` block and executes only the `else` block.

(assert_invalid
  (module
    (func $dynamic-condition (result i32)
      (if (result i32) 
        (i32.eq
          (i32.const 5)
          (i32.const 5)
        )
        (then
          (i32.const 1)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)