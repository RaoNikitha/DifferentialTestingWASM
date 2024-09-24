;; 6. **Recursive Imports and Returns**:    - Create a scenario where a function recursively calls an imported function from another module and ensure the recursion and returns are correctly managed across the module boundary.

(assert_invalid
  (module
    (import "env" "recursive_func" (func $recursive_func (result i32)))
    (func $test_recursive_returns (result i32)
      (call $recursive_func)
      (return)
    )
  )
  "type mismatch"
)