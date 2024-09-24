;; 2. **Single Target with Matching Type Sequence**    - Provide just one target label in the `br_table` and ensure the operand type sequence matches the default label’s type sequence. This ensures proper type sequence handling and checks for single target scenarios.

(assert_invalid
  (module (func $single-target-matching-type
    (block (result i32) (i32.const 1)
      (br_table 0 0 (i32.const 0))
    )
  ))
  "type mismatch"
)