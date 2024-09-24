;; - **Test 2**: Utilize a loop with multiple nested branches (`br_if` and `br_table`) targeting it. Combine this with local variable manipulations to observe if stack unwinding preserves the correct order of variables. Mismanagement might lead to incorrect variable states.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (local.set 1 (i32.const 5))
        (br_if 0 (i32.eq (local.get 0) (i32.const 0)))
        (local.set 1 (i32.add (local.get 1) (i32.const 1)))
        (br_table 0 0 (local.get 1))
      )
      (local.get 1)
    )
  )
  "type mismatch"
)