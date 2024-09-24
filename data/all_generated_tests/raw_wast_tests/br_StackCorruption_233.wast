;; 4. Set up a `block` with an array of different operand types on the stack, followed by a `br` instruction targeting an outer `block`. Ensure the stack is correctly unwound to the target and the operands are managed accurately. Verify issues with stack height not matching expected results post-unwind.

(assert_invalid
  (module
    (func $type-mismatch-in-br-targeting-block
      (block (result i32 f64)
        i32.const 42
        f64.const 3.14
        (block
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)