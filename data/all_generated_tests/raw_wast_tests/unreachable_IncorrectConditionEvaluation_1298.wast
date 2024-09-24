;; 9. Test a function call preceding conditional branch with an `unreachable` in the branch's block. Check for condition impact on branch decision post function call. Constraint: Ensures function calls do not interfere with the subsequent condition evaluation. Example: `(call $someFunction) (i32.const 1) (br_if 0 (unreachable))`

(assert_invalid
  (module (func $test
    (call $someFunction)
    (i32.const 1)
    (br_if 0 (unreachable))
  ))
  "type mismatch"
)