;; 4. **`nop` instruction followed by a mismatched `br` (branch) type**:    Follow a `nop` instruction with a branch instruction that expects a specific type value which is not on the stack.    This tests if the `nop` influences the branch type checking.

(assert_invalid
  (module (func (block (nop) (br 0 (i32.const 0)))))
  "type mismatch"
)