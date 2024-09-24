;; 6. Create a test where the `br` instruction triggers multiple backward branches within a loop, testing the stack consistency after each backward jump to avoid stack underflow or overflow.

(assert_invalid
  (module (func $nested-loop-unwind-operand-stack (result i32)
    (loop $loop1 (result i32)
      (i32.const 1)
      (block $block1 (result i32)
        (i32.const 2)
        (block (br 2))
      )
      (br 0)
    )
  ))
  "type mismatch"
)