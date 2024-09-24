;; - Test 6: Attempt to call a non-function reference via `call_indirect` (e.g., a null reference or an incompatible table entry). Verify that this misalignment in stack content and types results in a trap and stack corruption is avoided.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) (ref.null func))
    (func $test-func
      (call_indirect (type $sig) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)