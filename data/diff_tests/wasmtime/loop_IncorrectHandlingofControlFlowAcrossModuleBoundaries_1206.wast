;; 7. **Test 7**:    - Description: Implement a loop calling an imported function where the function itself enters another loop, ensuring the operand stack's state remains correct.    - Specific Constraint: Verify stack handling with nested loops where one loop is inside an externally called function.    - Control Flow Relation: Tests nested loops' ability to manage operand stacks amidst cross-boundary calls.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $nestedLoopTest
      (block
        (loop
          (call $externalFunc)
          (br 0)
        )
      )
    )
  )
  "stack is not handled correctly with nested loops"
)