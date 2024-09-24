;; 1. Insert `nop` inside an empty `block` structure and check if the block's execution flow remains unchanged.    **Constraint:** Ensure `nop` inside a `block` doesn't alter the control flow.

(assert_invalid
  (module (func (block (nop))))
  "block type mismatch"
)