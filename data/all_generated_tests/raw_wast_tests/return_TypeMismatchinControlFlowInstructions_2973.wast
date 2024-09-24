;; 2. **Test 2 - Type Mismatch in Loop Result**:    - Description: Implement a loop with a return instruction that should return an integer value. Instead, provide a string (invalid type) before the return.    - Constraint: Validates that the loop's return type is enforced and any type inconsistencies are caught by the `return` instruction.

(assert_invalid
  (module
    (func $type-mismatch-in-loop-result (result i32)
      (loop (return (i32.const 0) (i32.const 1)))
    )
  )
  "type mismatch"
)