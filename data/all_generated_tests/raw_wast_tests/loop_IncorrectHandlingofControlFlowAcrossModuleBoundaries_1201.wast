;; 2. **Test 2**:    - Description: Design a loop that includes a conditional branch (`br_if`) to a label within the same function, which in turn calls an imported function. Verify if the operand stack is correctly handled across the function call.    - Specific Constraint: The `br_if` should correctly unwind the stack up to the loop’s entry height.    - Control Flow Relation: Ensures conditional branching within loops handles transitions between modules correctly.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func
      (local i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (call $external_func (i32.const 0)))
      )
    )
  )
  "type mismatch"
)