;; 1. **Deeply Nested Blocks with `nop` Interspersed**:    Test a deeply nested set of blocks where `nop` instructions are placed at varying depths. Ensure that execution correctly passes through each layer without altering the intended flow. This checks for the maintenance of block hierarchy and sequential flow.

(assert_invalid
  (module
    (func (block
            (block
              (block
                (nop))
              (nop))
            (nop))))
  "type mismatch"
)