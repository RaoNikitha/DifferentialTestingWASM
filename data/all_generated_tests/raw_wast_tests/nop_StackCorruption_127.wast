;; 8. Position several `nop` instructions before, between, and after a sequence of arithmetic instructions (`i32.add`, `i32.sub`, `i32.mul`) to confirm that these `nop` instructions do not disrupt the correct operand fetch and result storage on the stack.

(assert_invalid
  (module (func (result i32)
    nop
    i32.const 3
    nop
    i32.const 4
    nop
    i32.add
    nop
  ))
  "type mismatch"
)