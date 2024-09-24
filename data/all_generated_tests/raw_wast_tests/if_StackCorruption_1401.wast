;; Create an `if` instruction where the `else` block requires more values from the stack than the `then` block leaves. This tests whether the `else` block correctly validates against the block type and ensures the stack is managed properly.

(assert_invalid
  (module (func $type-stack-depth-error (result i32)
    (i32.const 1) (if (result i32)
      (then (i32.const 2) (i32.add) (i32.const 3))
      (else (i32.const 4) (i32.const 5) (i32.add) (i32.add))
    )
  ))
  "type mismatch"
)