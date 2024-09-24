;; 6. **Test `nop` Following Computation and Preceding Conditional Branch**: After some arithmetic operations that influence a `br_if` condition, place a `nop`. Verify the condition evaluation remains correct leading to proper branching.

(assert_invalid
  (module (func (block (i32.eq (i32.const 42) (i32.const 1)) (nop) (br_if 0 (i32.eqz)))))
  "type mismatch"
)