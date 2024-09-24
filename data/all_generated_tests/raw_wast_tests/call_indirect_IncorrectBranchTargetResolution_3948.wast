;; 7. Test an interaction where `call_indirect` is within a loop closed by a conditional `br_if` statement. Design it so that a wrong branch skip bypasses the stack preparation for the indirect call, causing a stack underflow trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func (param i32)
      (loop
        (i32.const 0)
        (br_if 0 (i32.const 1)) ;; wrong branch skip: bypass stack preparation
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "stack underflow"
)