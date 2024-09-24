;; 9. Perform a call to a function that internally modifies global state or static data. Ensure that stack handling within the call does not interfere with correctly modifying and restoring this shared data.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify-global
      local.get 0
      global.set $g
    )
    (func $call-modify-global
      i32.const 42
      call $modify-global
    )
    (func $test-nested-call
      call $call-modify-global
    )
  )
  "function index out of range"
)