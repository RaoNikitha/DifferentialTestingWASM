;; 1. **Test 1: Cross-Module Function Call within If-Then Block**:    - Description: Validate calling an imported function from another module within the `then` block of an `if` instruction, ensuring the operand stack remains consistent across the module boundary.    - Specific Constraint: The function call transition between the modules should maintain the stack as per the `blocktype` result.    - Relation to Control Flow: Ensures proper flow and stack consistency when crossing module boundaries in the `if` instruction's `then` block.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32)))
    (func $test (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call $imported)
        )
      )
    )
  )
  "type mismatch"
)