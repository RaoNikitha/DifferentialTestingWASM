;; 4. **Mismatch Between Import-Export Operand Types**:    - Test Description: Set up a scenario where an imported function called via `br_table` returns a different type from what the branch expects. The test checks control flow and operand stack for errors induced by such type mismatches.    - Constraint: Evaluates type checking mechanisms and stack state consistency when `br_table` references imports with deviating types.    - Differential Reasoning: `wizard_engine` might skip stringent type validation due to peculiarities in how it pops values.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call $external_func)
            (br_table 0 1 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)