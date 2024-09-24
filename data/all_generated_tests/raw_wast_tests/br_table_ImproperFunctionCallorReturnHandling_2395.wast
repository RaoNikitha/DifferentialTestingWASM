;; 5. **Test 5: Return from Function Then Branch**    - Description: Test returning from a function call and immediately use `br_table` to branch. Ensure proper value placement and control flow.    - Constraint Checked: Correct manipulation and control flow after a function return.    - Improper Function Call or Return Handling: Validating control flow consistency after function return and subsequent branching.

(assert_invalid
  (module
    (func $return-from-function-then-branch
      (block (result i32)
        (call $dummy_func)
        (return (br_table 0))
      )
      (i32.eqz) (drop)
    )
    (func $dummy_func (result i32)
      (i32.const 1)
    )
  )
  "type mismatch"
)