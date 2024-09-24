;; 3. **Incorrect Operand Stack Heights in Loops**:    - Design a scenario where a `loop` instruction manipulates the operand stack inconsistently (e.g., branching with mismatched operand heights). Test if the operand stack unwinding and height checks maintain the correct CFG in both environments.

(assert_invalid
  (module
    (func $incorrect-operand-stack
      (loop (result i32)
        (br 0 (i32.const 1) (i32.const 2))
      )
    )
  )
  "type mismatch"
)