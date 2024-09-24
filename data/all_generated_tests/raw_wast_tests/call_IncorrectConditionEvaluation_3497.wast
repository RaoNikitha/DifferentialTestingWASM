;; Test 6: Implement a function that calls another function based on a condition's evaluation involving global variables. Test with edge cases for global variable values to see if both implementations handle the calls and conditions consistently.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $callee)
    (func $caller
      (global.set $g (i32.const -2147483648))
      (if (i32.eq (global.get $g) (i32.const -2147483648))
        (then (call $callee))
      )
    )
  )
  "unknown function"
)