;; 8. Test a `loop` where each iteration performs multiple stack operations like pushing, popping, and duplicating values. Compare stack contents before and after the loop to ensure they align precisely.

(assert_invalid
  (module (func
    (loop (result i32)
      (i32.const 10)
      (i32.const 5)
      (i32.add)
      (tee_local 0)
      (i32.const 1)
      (i32.sub)
      (br_if 0)
    )
  ))
 "type mismatch"
)