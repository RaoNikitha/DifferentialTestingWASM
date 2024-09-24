;; 5. Develop a module where a function modifies a global variable and another function reads this variable. Ensure that the global variable's state remains consistent after multiple calls.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global (global.set $g (i32.add (global.get $g) (i32.const 1))))
    (func $read_global (result i32) (global.get $g))
    (func $test_call
      (call $modify_global)
      (call $read_global)
      (call $modify_global)
      (call $read_global)
      (call $modify_global)
      (call $read_global)
    )
    (start $test_call)
  )
  "type mismatch"
)