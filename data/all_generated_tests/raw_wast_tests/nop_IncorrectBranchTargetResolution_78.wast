;; 9. **Dynamic Calls with `nop` and Branches:**    - **Description**: Use dynamic function calls with `nop` and `br` to different targets within called functions and ensure the correct targets are reached.    - **Constraint Checked**: Validates that `nop` within dynamically called functions does not affect branch target resolution.    - **Relation to Incorrect Branch Target Resolution**: Ensures dynamic calls respect `br` targets and `nop` placement.

(assert_invalid
  (module
    (func $func1 (block (br 0) (nop)))
    (func (call $func1))
  )
  "incorrect branch target resolution"
)