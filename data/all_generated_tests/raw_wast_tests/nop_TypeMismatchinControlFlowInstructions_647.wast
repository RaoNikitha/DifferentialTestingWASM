;; 8. A `block` followed by a `nop` and a return instruction that incorrectly assumes a value has been pushed onto the stack within the block.

(assert_invalid
  (module
    (func (result i32)
      (block
        (nop)
        (return))))
  "type mismatch"
)