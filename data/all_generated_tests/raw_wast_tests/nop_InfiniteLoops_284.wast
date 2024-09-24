;; 5. **Test with `block` containing `loop` that uses `nop` preceding `br`**:    - **Constraint**: Verifies correct handling of `nop` before unconditional branches within nested blocks and loops.    - **Relation to Infinite Loops**: Mismanaged `nop` could prevent `br` from correctly exiting loops, causing infinite iteration.

(assert_invalid
  (module
    (func (block (loop (nop) (br 1)))))
  "type mismatch"
)