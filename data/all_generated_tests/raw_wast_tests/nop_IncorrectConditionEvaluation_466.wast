;; 7. Create a function with a `nop` followed by a read from the operand stack and use that value in a `br_if` condition. Validate each implementation's response to this condition to ensure consistent branching.

(assert_invalid
  (module (func (block (nop) (br_if 0 (i32.const 1)))))
  "type mismatch"
)