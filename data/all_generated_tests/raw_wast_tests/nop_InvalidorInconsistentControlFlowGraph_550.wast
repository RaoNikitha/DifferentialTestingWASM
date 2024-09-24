;; 1. **Test an Empty Block with Only `nop` Instructions**:    - Create a WebAssembly function containing a sequence of `nop` instructions within an otherwise empty block. Validate how each implementation handles the CFG when encountering a sequence that should logically do nothing.    - Constraint: Validates that `nop` does not alter the control flow and properly maintains the empty state.

(assert_malformed
  (module (func (block (nop) (nop) (nop))))
  "unexpected instruction"
)