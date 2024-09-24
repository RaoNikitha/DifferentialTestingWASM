;; Utilize a conditional branch with `br_if` that erroneously skips a valid `call_indirect` due to incorrect stack handling, ensuring the condition leads to expected control flow changes.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test
      (i32.const 1)
      (br_if 0 (i32.const 1)) ; Incorrectly handles stack, should lead to type mismatch
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)