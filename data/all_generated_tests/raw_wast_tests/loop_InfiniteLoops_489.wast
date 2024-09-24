;; 10. **Test by Using Function Calls**: A loop that calls a function indirectly within the loop body, with `br` trying to exit the loop based on the function’s return value. Focus on proper function call and return handling ensuring loop terminates as expected.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (func $f (type $t) (i32.const 1))
    (table funcref (elem $f))
    (func $type-indirect-call (result i32)
      (local $0 i32)
      (loop (result i32)
        (local.set $0 (call_indirect (type $t) (i32.const 0)))
        (br_if 0 (i32.eq (local.get $0) (i32.const 0)))
        (local.get $0)
      )
    )
  )
  "type mismatch"
)