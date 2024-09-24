;; 8. **Test Description**: Call a function that performs arithmetic checks with `br_if`. If the condition's result is consistently mis-evaluated, it should incorrectly continue or exit, altering the subsequent arithmetic results and overall output.

(assert_invalid
  (module
    (func $arith-check (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.mul (local.get 0) (i32.const 2)))
      (local.set 1 (i32.add (local.get 1) (i32.const 3)))
      (br_if 0 (i32.eq (local.get 1) (i32.const 7)))
      (local.get 1)
    )
    (func $main (result i32)
      (call $arith-check (i32.const 2))
    )
  )
  "type mismatch"
)