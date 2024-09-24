;; 3. **Mismatched Block Type**: Create a loop where the block type specifies different operand and result types compared to the actual usage. This checks whether the operand stack is pushed and popped correctly based on the `blocktype`, testing consistent type handling across both implementations.

(assert_invalid
  (module (func $test-mismatched-block-type
    (loop (result i32) (i32.const 42) (f32.const 0.0) (br 0))
  ))
  "type mismatch"
)