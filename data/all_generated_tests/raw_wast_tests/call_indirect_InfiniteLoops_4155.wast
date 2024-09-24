;; Test 4: Use `call_indirect` within a loop and have the function being called contain another loop. If the indirect call signature is mismatched, check if this results in the inner loop executing indefinitely, creating cascading infinite loops.

(assert_invalid
  (module
    (type $outer (func (param i32)))
    (type $inner (func))
    (table funcref (elem $indirect_call))
    (func $inner_loop (loop (br 0)))
    (func $indirect_call (type $outer)
      (loop
        (call_indirect (type $inner) (i32.const 0))
      )
    )
  )
  "type mismatch"
)