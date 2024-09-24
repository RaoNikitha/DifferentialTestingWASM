;; 6. **Control Flow Disruption with Recursive Import Call**:    - Test Description: A `br_table` targets a recursive call to an imported function. This test checks for proper handling of operand stack and control flow across recursive calls involving different module boundaries.    - Constraint: Verifies if `br_table` can manage recursive calls with stack consistency and control flow accuracy across modules.    - Differential Reasoning: `wizard_engine` may encounter stack promotion or recursive call handling errors due to procedural style.

(assert_invalid
  (module
    (import "env" "rec_func" (func $rec_func (result i32)))
    (func
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 0) (call $rec_func))
        )
      )
    )
  )
  "type mismatch"
)