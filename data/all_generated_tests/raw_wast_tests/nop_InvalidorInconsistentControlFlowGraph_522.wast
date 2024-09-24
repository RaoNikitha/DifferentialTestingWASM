;; 3. **Test `nop` between Branch Instructions**:    Insert `nop` between various branching instructions (e.g., `br`, `br_if`, `br_table`) and check for correctness in control flow.

(assert_invalid
  (module
    (func (block (br 0) (nop)))
  )
  "unexpected return type"
)