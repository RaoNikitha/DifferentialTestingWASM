;; 4. Utilize `nop` in a sequence of `block` constructs that push and pop different values on the stack to validate that the presence of `nop` does not introduce stack state anomalies during block entry and exit.

(assert_invalid
  (module (func (result i32) (block (result i32) (i32.const 1) (nop) (i32.const 2)) (i32.add)))
  "type mismatch"
)