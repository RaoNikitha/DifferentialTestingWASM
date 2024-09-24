;; 9. Execute a function call where global variables are modified within the called function; check for consistent global state after the call returns.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test
      (call 1)
      (global.set $g (i32.const 10))
    )
    (func (result i32)
      (global.set $g (i32.const 5))
      (global.get $g)
    )
  )
  "type mismatch"
)