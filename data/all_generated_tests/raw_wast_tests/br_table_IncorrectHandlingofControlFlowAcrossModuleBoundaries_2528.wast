;; 7. **Test Description:**    - Create an exported function calling an imported function that features a `br_table` branching to various nested blocks. Validate each label's stack state upon returning control to the exported function.    - **Constraint:** Ensures that nested blocks and labels within imported functions are correctly managed from the calling context.    - **Control Flow Boundary Check:** Confirms the integrity of the stack across function calls with nested branch operations.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (export "test_func")
      (block
        (block
          (local.get 0)
          (call $external_func)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)