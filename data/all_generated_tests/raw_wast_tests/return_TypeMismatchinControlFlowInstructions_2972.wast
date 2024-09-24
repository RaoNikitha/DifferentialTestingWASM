;; 1. **Test 1 - Type Mismatch in Block Return Values**:    - Description: Create a function with a block that contains a return instruction. Ensure the block expects an integer type, but provide a floating-point value before the return.    - Constraint: This test checks whether the `return` instruction correctly identifies type mismatches between the block's expected return type and the provided value.

(assert_invalid
  (module
    (func $type-mismatch-block-return (result i32)
      (block (result i32)
        (f32.const 0.0)
        (return)
      )
    )
  )
  "type mismatch"
)