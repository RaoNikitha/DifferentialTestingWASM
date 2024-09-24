;; - Test 4: Test boundary conditions by providing a negative or excessively large index to `call_indirect`. Ensure the implementation checks for out-of-bounds access, which could result in stack corruption by fetching unchecked memory references.

(assert_invalid
  (module
    (type $sig (func))
    (table funcref (elem func $f))
    (func $f (param))
    (func $test-call-indirect
      (call_indirect (type $sig) (i32.const -1))
    )
  )
  "type mismatch"
)