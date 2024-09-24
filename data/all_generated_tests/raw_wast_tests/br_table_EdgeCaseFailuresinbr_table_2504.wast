;; ```  4. **Single Label Loop Back**:    ```plaintext    Use a `br_table` instruction with a single label that loops back to itself and check consistency of stack unwinding and operand count verification. This tests if self-referential labels maintain correct operand stack management.

(assert_invalid
  (module (func $single-label-loop-back
    (block $outer (br_table 0 0 (i32.const 0)) (i32.const 1))
  ))
  "type mismatch"
)