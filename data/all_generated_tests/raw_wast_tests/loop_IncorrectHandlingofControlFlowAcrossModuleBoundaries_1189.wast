;; 10. **Test 10: Loop with Imported Function Modifying Loop Counter**:    - A loop that calls an imported function which modifies the loop counter used to control the loop execution.    - **Constraint Checked**: Ensures loop control variables modified by imported functions are correctly reflected in the loop control logic.    - **Relevance**: Tests proper synchronization of loop variables across module boundaries during loop executions.

(assert_invalid
  (module
    (import "env" "modify_counter" (func $modify_counter (param i32) (result i32)))
    (func (result i32)
      (i32.const 10)
      (loop (result i32)
        call $modify_counter
        br_if 0
      )
    )
  )
  "type mismatch"
)