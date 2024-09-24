;; 2. **Conditional Branch within Loop with Immediate Return**:    Implement a loop containing a `br_if` instruction that is supposed to break out of the loop under specific conditions. Following the conditional branch, immediately place a `return` instruction. This test verifies if the correct operand is handled by the conditional branch to avoid an infinite loop caused by incorrect `return` execution.

(assert_invalid
  (module
    (func $conditional-branch-in-loop (result i32)
      (i32.const 1)
      (i32.const 0)
      (loop (result i32)
        (br_if 1 (i32.const 1))
        (return (i32.const 2))
      )
    )
  )
  "type mismatch"
)