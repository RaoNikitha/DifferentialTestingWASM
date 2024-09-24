;; 10. **Incorrect Block Type Handling**     - Create a loop where `blocktype` declarations are intentionally ambiguous or incorrectly matched to pushed values on the stack. The test ensures that incorrect or misaligned block types do not lead to stack corruption during branch execution.

(assert_invalid
  (module (func $incorrect-block-type
    (loop (result i32) (f32.const 1.0) (br 0))
  ))
  "type mismatch"
)