;; 2. **Forward Branch to Imported Function**:    - Test Description: Construct a module with an imported function and a `br_table` instruction inside a forward branch. The labels will target an external function, assessing if the stack state and operand types remain consistent across the function call.    - Constraint: Ensures the forward branch from `br_table` respects the operand stack configuration entering and exiting the imported function.    - Differential Reasoning: `wizard_engine` might fail in maintaining operand stack states during forward branching through an imported function.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func
      (block
        (br_table 0 0)
        (call $external_func)
      )
    )
  )
  "type mismatch"
)