;; 5. **Test Description**: A `br_table` where an out-of-bounds operand leads to the default target, but the default target's operand types mismatches those of other labels, checking if the default branch target correctly handles stack management and prevents incorrect label resolution.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result f32) (br_table 0 1 (i32.const 2) (i32.const 0)))
    )
  ))
  "type mismatch"
)