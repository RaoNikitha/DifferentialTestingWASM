;; 8. **Test 8**: Implement a `block` with mixed correct `i32` and incorrect `f32` operations halfway, ensuring the final stack state violates the blocktype’s expected result type. This checks for partial type mismatches within control flow instructions.

(assert_invalid
  (module
    (func $test-8
      (block (result i32)
        (i32.const 10)
        (f32.const 1.0)
        (br 0)
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)