;; 3. **Test Description**: Create a function which uses `br_if` to change control flow based on a global variable imported from another module, ensuring the stack is unwound according to the global's value.    - **Constraint Checked**: Verifies stack integrity and proper unwinding based on cross-module variable states.    - **Relation to Control Flow**: Tests correctness of stack operations influenced by external module states.

(assert_invalid
  (module
    (import "env" "external_var" (global $ext_var i32))
    (func $test_func
      (block (result i32)
        (br_if 0 (global.get $ext_var))
      )
    )
  )
  "invalid global use"
)