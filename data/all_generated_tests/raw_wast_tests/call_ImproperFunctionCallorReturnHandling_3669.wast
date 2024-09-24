;; 8. Call a function from a loop with varying argument counts and types, ensuring arguments are properly managed and no stack corruption occurs.

(assert_invalid
  (module
    (func $f (param i32 i32))
    (type $sig (func (param i32 i32)))
    (table funcref (elem $f))
    (func $call-in-loop
      (loop
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)