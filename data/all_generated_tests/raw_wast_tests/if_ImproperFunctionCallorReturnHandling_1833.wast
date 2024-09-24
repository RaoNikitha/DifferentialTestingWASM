;; 4. **Function Call in Else Block with Differing Return Types**:    - Test Description: Include a function call in the `else` block of an `if` statement where the function's return types differ from the block's output types.    - Relevant Constraint: Checks consistency between function output and `else` blocktype constraints.    - Improper Handling Scenario: `wizard_engine` might fail to align return types correctly, causing incorrect stack states.

(assert_invalid
  (module
    (type $funcType (func (result i32)))
    (func $example (result i32) (i32.const 1))
    (func $test
      (if (result i32) (i32.const 0)
        (then (i32.const 1))
        (else (call $example) (i32.const 1) (drop))
      )
    )
  )
  "type mismatch"
)