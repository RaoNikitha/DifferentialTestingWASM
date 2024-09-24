;; 8. **Test: Passing Control Between Nested Loops Across Imports with `br_if`**    - **Constraint Checked:** Validate that `br_if` deals correctly with nested loop exits in an imported function.    - **Description:** An imported function has nested loops using `br_if` for conditional exits. From another module, call this function, ensuring the control flow and stack integrity with nested structure labeling.

(assert_invalid
  (module
    (import "env" "nested_loops" (func $nested_loops (result i32)))
    (func (call $nested_loops))
  )
  "type mismatch"
)