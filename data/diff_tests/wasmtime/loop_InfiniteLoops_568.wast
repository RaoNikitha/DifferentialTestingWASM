;; 9. **Test Name: Infinite Loop with External Function Call**    - **Description**: Include a function call inside the loop, where a branch immediately after the call ensures the loop continues infinitely.    - **Constraint Checked**: Interaction between function call returns and branch instructions within loop.    - **Infinite Loop Relation**: The function does not affect loop end condition, causing an infinite loop.

(assert_invalid
  (module
    (func $external (import "env" "external") (result i32))
    (func (loop (br 0) (call $external) br 0))
  )
  "unreachable code"
)