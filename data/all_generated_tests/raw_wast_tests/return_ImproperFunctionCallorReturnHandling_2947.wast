;; 6. **Function Returning Complex Type**:    Define a function that returns a complex type (e.g., multiple values). Call this function from another function and ensure the correct handling and mapping of multiple return values.

(assert_invalid
  (module
    (func $complex_return (result i32 f32)
      (i32.const 1)
      (f32.const 2.0)
      (return)
    )
    (func $caller_block (result i32 f32)
      (call $complex_return)
      (return)
    )
  )
  "type mismatch"
)