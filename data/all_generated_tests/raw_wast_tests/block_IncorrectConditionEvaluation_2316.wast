;; 7. Test a `block` with a `br_if` condition involving multiple logical operations (e.g., AND, OR), ensuring the condition is correctly evaluated and the correct `end` instruction is reached based on the operand stack.

(assert_invalid
  (module (func $test_block_with_br_if (result i32)
    (block (result i32)
      (i32.const 1)
      (i32.const 0)
      (i32.or)
      (br_if 0 (i32.const 1))
      (i32.const 42)
    )
  ))
  "type mismatch"
)