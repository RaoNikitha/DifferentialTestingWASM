;; 3. **Test 3 - Multiple Nested Blocks with Inconsistent Types**:    - Description: Create multiple nested blocks where the outer block expects an integer, but the innermost block provides a floating-point value. Use a return instruction within the innermost block.    - Constraint: This verifies if the `return` instruction properly unwinds nested blocks and ensures type consistency across all layers.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result i32)
        (block (result f32)
          (block (return (f32.const 1.0)))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)