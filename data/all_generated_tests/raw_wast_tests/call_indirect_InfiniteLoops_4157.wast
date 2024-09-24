;; Test 6: Create a loop that uses `br` instructions to perform an early loop exit, with the loop body containing a `call_indirect`. Verify that a signature mismatch in the call prevents early loop exit, causing the loop to run indefinitely.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (param i32)))
    (func $f (param i32) (result i32)
      (i32.const 0)
    )
    (table funcref (elem $f))
    (func $type-mismatch-loop
      (loop
        (call_indirect (type $sig2) (i32.const 0) (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)