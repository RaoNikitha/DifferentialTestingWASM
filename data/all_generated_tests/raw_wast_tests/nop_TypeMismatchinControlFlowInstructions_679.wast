;; 10. **`nop` within a mismatched conditional return type inside a loop**:     Place a `nop` within a conditional statement (e.g., `if` inside a loop) where the `if` block modifies the operand stack in a way that the loop's return type expectation becomes invalid.     This ensures `nop` does not mask type inconsistencies within complex control flows.

(assert_invalid
  (module
    (func $type-loop-i64
      (loop (result i64)
        (i32.const 10)
        (if (result i64)
          (i32.const 1)
        )
        (nop)
      )
    )
  )
  "type mismatch"
)