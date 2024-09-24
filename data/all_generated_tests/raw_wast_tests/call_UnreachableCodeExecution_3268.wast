;; Test 7: Construct a function that calls another function responsible for modifying a global variable, which in turn causes an 'unreachable' instruction due to invalid state management.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test (call $modify_global))
    (func $modify_global
      (global.set $g (i32.const 42))
      (unreachable)
    )
  )
  "unreachable reached"
)