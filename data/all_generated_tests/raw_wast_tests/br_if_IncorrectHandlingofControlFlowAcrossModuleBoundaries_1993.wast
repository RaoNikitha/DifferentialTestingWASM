;; 4. **Test: Nested Blocks with `br_if` Across Import Boundaries**    - **Constraint Checked:** Confirm correct handling of nested blocks and label indexing when an imported function uses `br_if`.    - **Description:** An imported function contains nested blocks, each potentially exiting via `br_if`. Call this function from another module and ensure the correct block and label references are maintained when exiting nested blocks.

(assert_invalid
  (module
    (import "env" "nested_func" (func $nested_func))
    (func $test
      (block
        (call $nested_func)
      )
    )
  )
  "type mismatch"
)