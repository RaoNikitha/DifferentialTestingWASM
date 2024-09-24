;; 8. **Test 8 - Type Errors in Unwinded Blocks**:    - Description: Design a sequence with multiple blocks where inner blocks push different types (e.g., integers and floats) and the return instruction tries to unwind them with an incorrect type.    - Constraint: Ensures that `return` correctly unwinds operand stacks and detects type inconsistencies.

(assert_invalid
  (module
    (func $type-errors-in-unwinded-blocks (result i32)
      (block
        (block
          (i32.const 0)
          (f32.const 1.0)
          (return)
        )
      )
    )
  )
  "type mismatch"
)