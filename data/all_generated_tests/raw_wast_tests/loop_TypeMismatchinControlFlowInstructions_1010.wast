;; 1. **Mismatch between Declared and Expected Block Type**: Create a loop block that declares a block type returning an integer but includes instructions that produce a float result. This will test the proper enforcement of the declared block type against the instructions within the block.

(assert_invalid
  (module (func $type-mismatch-result
    (loop (result i32) (f32.const 0.0))
  ))
  "type mismatch"
)