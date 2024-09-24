;; 1. **Test for Simple Loop with Mismatched Block Type**: Create a loop where the block type expects an `i32` but the instructions within the loop result in an `f32`. This should fail type validation, testing how each implementation handles type mismatches in block types.

(assert_invalid
  (module (func (result f32) 
    (loop (result i32) (f32.const 0.0))
  ))
  "type mismatch"
)