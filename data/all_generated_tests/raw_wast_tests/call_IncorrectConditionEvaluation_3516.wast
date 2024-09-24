;; 5. Test a conditional branch (`br_if`) that relies on multiple stack values evaluated after several function calls in sequence. Incorrect condition evaluation would result in an unexpected branching decision and subsequent incorrect stack state.

(assert_invalid
  (module
    (func $conditional-branch
      (call 1)
      (call 2)
      (br_if 0 (i32.const 1)) 
      (call 3)
    )
    (func (param i32))
    (func (param f32))
    (func (param i64))
  )
  "type mismatch"
)