;; 5. **Test 5**: Design an `if` instruction containing a sequence of mathematical operations that continuously increase the stack size in the `then` branch and a single `drop` instruction in the `else` branch. This would reveal any improper stack height management by causing an underflow on the `else` branch execution.

(assert_invalid
  (module (func $stack-management-test
    (if (result i32) (i32.const 1)
      (then (i32.const 1) (i32.const 2) (i32.const 3) (i32.const 4) (i32.const 5))
      (else (drop))
    )
  ))
  "type mismatch"
)