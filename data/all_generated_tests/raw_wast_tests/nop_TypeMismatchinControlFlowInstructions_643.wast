;; 4. A test with nested `block`s where the inner block concludes with a `nop` followed by a type-dependent instruction with mismatching operand stack requirements.

(assert_invalid
  (module (func (block (block (nop) (i32.const 0)))) "type mismatch")
)