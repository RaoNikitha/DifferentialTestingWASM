;; - **Test Description 1**: A simple `if` instruction with a direct `i32.const 0` condition followed by an `else` block containing an instruction that pushes a value onto the stack. Validate that the implementation correctly skips the `then` block and executes the `else` block.

(assert_invalid
  (module (func $test_if_instruction (result i32)
    (if (result i32) (i32.const 0)
      (then (i32.const 1))
      (else (i32.const 2))
    )
  ))
  "invalid type"
)