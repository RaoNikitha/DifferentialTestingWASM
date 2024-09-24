;; 10. **Test Description**: Use `nop` in sequences that include indirect branches, and ensure the correct block or function targets are hit.    **Constraint Checked**: `nop` doesn’t impact indirect branching logic.    **Relation to CFG**: Verifies indirect jumps aren’t corrupted by the presence of intervening `nop` instructions.

(assert_invalid
  (module
    (func (block (nop) (br 0)))
    (table funcref (elem)))
  "type mismatch"
)