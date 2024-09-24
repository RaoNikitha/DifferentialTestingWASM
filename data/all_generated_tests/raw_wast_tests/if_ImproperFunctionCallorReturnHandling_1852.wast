;; 3. A test where nested `if` blocks are used, with each inner `if` immediately performing a function call or return. The function calls and returns in the `then` and `else` blocks are carefully structured to challenge the correct unwinding and reset of the operand stack.

(assert_invalid
  (module
    (func $nested-if-returns
      (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (then (i32.const 1) (return))
        (else
          (if (result i32)
            (then (i32.const 2) (return))
            (else (i32.const 3))
          )
        )
      )
    )
  )
  "type mismatch"
)