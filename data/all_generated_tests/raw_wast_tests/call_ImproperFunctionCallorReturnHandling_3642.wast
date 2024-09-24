;; 1. **Test Description**:  Test a function call with mismatched argument types - Pass integers while the function expects floats.

(assert_invalid
  (module
    (type (func (param f64 f64) (result f64)))
    (func $mismatched-call (call 0 (i32.const 42) (i32.const 84))))
  "type mismatch"
)