;; 9. **Complex Nested Structure with Final NOPs**: Create a complex structure with nested `block`, `loop`, and `if` statements where the final instruction is `nop` in each branch. Verify that control flow and stack state are preserved.

(assert_invalid
  (module (func (block (block (loop (if (then (nop)))) (nop))) (nop)))
  "type mismatch"
)