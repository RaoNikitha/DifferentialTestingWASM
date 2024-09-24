;; Test 6: Create a scenario where mismatched types on the operand stack lead to improper execution flow, ultimately hitting an 'unreachable' instruction.

(assert_invalid
  (module
    (func (param i32) (result i64)
      (block (i64.const 0) (call 1))
    )
    (func (param i32) (result i32) (i32.const 0))
  )
  "type mismatch"
)