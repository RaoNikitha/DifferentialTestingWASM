;; 9. **Test 9: Module Calling Chain Breakdown**    - Description: Create a chain of function calls spreading across several imported and exported functions, each ending with a return instruction.    - Relation: This test checks if complex call chains with return instructions are correctly handled without control flow breakdowns.

(assert_invalid
  (module
    (import "env" "func_1" (func $func_1 (result i32)))
    (import "env" "func_2" (func $func_2 (result i32)))
    (import "env" "func_3" (func $func_3 (result i32)))
    (func $type-module-calling-chain-breakdown (result i32)
      (call $func_1) (call $func_2) (call $func_3)
      (return) (i32.const 0)
    )
  )
  "type mismatch"
)