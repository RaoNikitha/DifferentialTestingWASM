;; 1. **Test 1: Calling Imported Function Without Return Value**    - Description: Create a module that imports a function from another module that does not return a value. The test checks if the calling function correctly handles the return instruction and maintains a consistent stack and control flow.    - Relation: This test checks if there is incorrect handling of control flow when an imported function completes execution.

(assert_invalid
  (module
    (import "env" "external_fn" (func $external_fn))
    (func $test_return_import
      (call $external_fn)
      (return)
    )
  )
  "type mismatch"
)