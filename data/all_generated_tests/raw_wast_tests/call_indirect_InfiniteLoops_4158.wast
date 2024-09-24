;; Test 7: Implement a recursive function that uses `call_indirect` and is invoked inside a loop. The recursion depth should depend on the indirect call’s success. Check if mismatched signatures result in the loop running infinitely due to never reaching the recursion base case.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $wrong_sig (func (param i32) (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) $recur_func)
    (func $recur_func (type $sig) (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (i32.eqz (local.get 0))
        (then (i32.const 0))
        (else
          (call_indirect (type $wrong_sig) (i32.sub (local.get 0) (i32.const 1)) (i32.const 0))
        )
      )
    )
    (func (start 1) (local i32) (i32.const 10) (block (loop (call $recur_func (local.get 0)) (br_if 0 (i32.ne (local.get 0) (i32.const 0)))))
  )
  "type mismatch"
)