;; 6. **Test Description**:    - Create an `if` instruction with the block type `[] -> [i32]`, but have the `then` branch not push any values to the stack.    - **Constraint Checked**: Lack of required output (`i32`) from `then` branch as per the block type specification.    - **Target**: Confirm that the engine correctly enforces the presence of expected output values.

(assert_invalid
  (module
    (func $if_without_required_output
      (if (result i32)
        (then)
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)