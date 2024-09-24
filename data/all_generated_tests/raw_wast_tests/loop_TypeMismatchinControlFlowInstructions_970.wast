;; 1. **Test 1: Mismatched Result Type in Loop Block**    - Description: Define a loop instruction that specifies a block type resulting in a single integer, but the enclosed instructions produce a float result.    - Reasoning: This tests that the type-checking mechanism correctly validates the result type, ensuring it matches the loop block type.

(assert_invalid
  (module (func $mismatched-result-type
    (loop (result i32) 
      f32.const 1.0
      drop
    )
  ))
  "type mismatch"
)