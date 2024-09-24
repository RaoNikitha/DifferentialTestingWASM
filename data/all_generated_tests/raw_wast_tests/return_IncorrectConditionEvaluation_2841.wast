;; 10. Implement a function with multiple return points protected by `br_if` conditions dependent on global state. Test if global condition mismanagement leads to inconsistency in final return values between implementations.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test_multiple_returns (result i32)
      (block $outer
        (br_if $outer (global.get $g))
        (i32.const 1)
        (return)
        (i32.const 2)
      )
      (i32.const 3)
    )
  )
  "type mismatch"
)