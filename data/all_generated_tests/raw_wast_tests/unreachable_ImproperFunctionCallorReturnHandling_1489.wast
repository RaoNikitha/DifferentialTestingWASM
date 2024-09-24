;; 10. Construct a test with overlapping `try`-`catch` blocks and calls to a function containing `unreachable`. Ensure the trap triggered by `unreachable` is appropriately caught and handled in both implementations.

(assert_invalid
  (module
    (func $cause_unreachable
      unreachable)
    (func $try_catch_test
      try 
        (call $cause_unreachable)
      catch
        (i32.const 0)
      end)
  )
  "type mismatch"
)