;; - Test 3: Define a function in the module type section with multiple return values. Invoke this function via `call_indirect` such that the stack lacks space for multiple return values. Verify that any resulting stack overflow or stack corruption is properly handled.

(assert_invalid
  (module
    (type $sig (func (result i32 i32)))
    (func $f (result i32 i32) (i32.const 1) (i32.const 2))
    (table funcref (elem $f))
    (func $test
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)