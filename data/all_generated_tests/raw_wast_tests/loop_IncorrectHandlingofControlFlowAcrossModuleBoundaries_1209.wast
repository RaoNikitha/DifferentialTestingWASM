;; 10. **Test 10**:     - Description: Construct a loop with indirect function calls (`call_indirect`) to imported functions, ensuring the operand stack is maintained correctly.     - Specific Constraint: Verifies that `call_indirect` correctly manages the operand stack and the control flow between modules.     - Control Flow Relation: Ensures proper handling of indirect function calls in loops across module boundaries.

(assert_invalid
  (module
    (import "env" "func" (func $imported (param i32)))
    (func
      (loop
        (i32.const 1)
        (call_indirect (type (func (param i32) (result i32))) (i32.const 0) (i32.const 2))
      )
    )
  )
  "type mismatch"
)