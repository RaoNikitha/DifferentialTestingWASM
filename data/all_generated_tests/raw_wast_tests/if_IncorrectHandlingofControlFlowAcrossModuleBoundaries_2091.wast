;; 2. **Test 2: Cross-Module Function Call within If-Else Block**:    - Description: Validate calling an imported function from another module within the `else` block of an `if` instruction, with heap and stack consistency across the boundary.    - Specific Constraint: The operand stack should correctly handle and transition the call while maintaining `blocktype` constraints.    - Relation to Control Flow: Validates that the `else` block handles cross-module boundary function calls without stack issues.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then (i32.const 1))
        (else (call $external_func))
      )
    )
  )
  "type mismatch"
)