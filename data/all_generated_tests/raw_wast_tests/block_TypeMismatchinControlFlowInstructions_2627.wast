;; - **Test 8 Description**:   Design a `block` that finishes execution with a wrong output type on the stack. For example, a block starting with `[i32] -> [i32]` but altered instructions end with `[f32]`. This tests the engine's capability to check post-execution stack states against the expected result type.

(assert_invalid
  (module 
    (func $type-mismatch-stack-end (result i32)
      (block (result i32)
        (f32.const 0.0)
      )
    )
  )
  "type mismatch"
)