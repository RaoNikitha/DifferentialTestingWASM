;; 4. Implement a block where a condition relies on a potentially altered stack value (e.g., after multiple `i32.add`) with `br_if`. The test verifies if the condition evaluation is accurately derived from the operand stack state.

(assert_invalid
  (module (func $type-block-br_if (result i32)
    (i32.const 10) (i32.const 5) (i32.add)
    (block (result i32) (i32.const 0) (br_if 0 (i32.const 1)) (i32.const 10))
  ))
  "type mismatch"
)