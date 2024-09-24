;; 10. **Early Loop Exit with Incorrect Operand Stack**:     - Create a test where a `br` instruction exits the loop early without correctly managing the operand stack, leading to an incorrect CFG. Check if both implementations handle early exits and operand stack integrity consistently.

(assert_invalid
  (module 
    (func $early-exit-with-incorrect-stack (result i32)
      (i32.const 1)
      (loop (result i32)
        (br 0)
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)