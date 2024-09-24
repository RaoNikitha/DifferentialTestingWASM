;; 3. Include `nop` instructions between push and pop operations on the operand stack, then verify that the stack maintains its expected state without underflows or overflows after each `nop` execution.

(assert_invalid
  (module
    (func (i32.const 0) (nop) (i32.store (nop)))
  )
  "type mismatch"
)