;; - Test 1: Define a function type expecting an integer and returning a boolean, but provide parameters of incorrect types (e.g., floating-point numbers). Verify error handling mechanisms for stack corruption due to improper type conformity when using `call_indirect`. The goal is to evaluate if improper type conformity is correctly identified and reported.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $sig))
    (func $incorrect-type (param f64) (result i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)