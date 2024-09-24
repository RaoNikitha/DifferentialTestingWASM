;; 4. A test where an `if` instruction has an `else` branch containing a loop with an `unreachable` instruction to ensure that the infinite loop trap is correctly identified and halts execution.

(assert_invalid
  (module
    (func $if_else_loop_unreachable
      (if (result i32) (i32.const 0)
        (then (i32.const 42))
        (else (loop (unreachable)))
      )
    )
  )
  "unreachable"
)