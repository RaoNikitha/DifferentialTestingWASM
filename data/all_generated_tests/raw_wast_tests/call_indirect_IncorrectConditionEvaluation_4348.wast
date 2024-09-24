;; 7. Test Description 7: Define an edge case where a call to an `indirect_call` occurs with the correct function type but passed incorrect parameter types. Follow it with a `br_if` condition that matches it with a true value to test for proper trapping due to parameter issues.

(assert_invalid
  (module
    (type $correct_sig (func (param i64) (result i32)))
    (table funcref (elem 0 (ref.func $correct_function)))
    (func $correct_function (param i64) (result i32)
      i32.const 1
    )
    (func $indirect_call_wrong_param
      (br_if 0 (call_indirect (type $correct_sig) (i32.const 0) (i32.const 42)))
    )
  )
  "type mismatch"
)