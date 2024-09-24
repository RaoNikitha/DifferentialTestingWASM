;; 6. **Function Calls with Internal Branches and `nop`:**    - **Description**: Create a function with embedded `nop` and `br` instructions. Call the function and check the control flow.    - **Constraint Checked**: Validates that `nop` does not interfere with internal branching within functions.    - **Relation to Incorrect Branch Target Resolution**: Ensures function-internal branch targets resolve correctly when `nop` is present.

(assert_invalid
  (module
    (func $function_with_br_and_nop
      (block
        (nop)
        (br 0)
        (nop)
      )
    )
    (func (call $function_with_br_and_nop))
  )
  "type mismatch"
)