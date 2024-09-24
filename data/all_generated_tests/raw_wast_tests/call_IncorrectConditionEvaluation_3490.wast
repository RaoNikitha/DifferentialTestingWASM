;; **Test 9**: Test nested function calls within conditional statements (e.g., multiple `br_if`). Check if the condition correctly triggers function calls or skips based on the evaluation, ensuring consistent call signature checks.

(assert_invalid
  (module
    (func $type-nested-call-in-conditional
      (i32.const 1)
      (br_if 0 (i32.eqz (call 1 (i32.const 0))))
      (call 2)
    )
    (func (param i32) (result i32) (i32.const 1))
    (func (result i32) (i32.const 2))
  )
  "type mismatch"
)