;; 1. A test where a `block` contains a `nop` followed by an instruction that expects a stack value. Ensure no values are on the stack entering or exiting the `block`.

(assert_invalid
  (module (func (block (nop) (i32.const 1) (i32.add))))
  "type mismatch"
)