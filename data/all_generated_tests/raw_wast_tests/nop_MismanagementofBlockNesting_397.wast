;; 8. **Nested `block` with Mixed Control Transfers and `nop`**:    Create a nested block scenario with mixed control transfer instructions (`br`, `br_if`, `br_table`) and introduce `nop` at different points. This verifies the maintenance of accurate control depth and target resolution.

(assert_invalid
  (module
    (func (block (block (nop) (br 1)) (nop) (br 0))))
  "type mismatch"
)