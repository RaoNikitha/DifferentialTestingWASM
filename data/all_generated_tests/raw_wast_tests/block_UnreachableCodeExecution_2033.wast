;; 4. **Unreachable After Valid Sequence**:    - Implement a sequence in the block that performs valid operations but concludes with `unreachable`.    - The focus is on legitimate sequencing of instructions within a valid block.    - Execution hitting the `unreachable` suggests invalid post-sequence continuation.

(assert_invalid
  (module (func $unreachable_after_valid_sequence (result i32)
    (block (result i32) (i32.const 42) (unreachable))
  ))
  "type mismatch"
)