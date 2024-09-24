;; 3. **Test with Nested `nop` Blocks:**    - Create nested blocks containing only `nop` instructions to test if the CFG correctly navigates through multiple layers of `nop` without error.    - **Constraint Tested:** Validates that `nop` does not affect nested control structures and maintains stack integrity.

(assert_invalid
  (module
    (func (block (block (block (nop) (nop)) (nop)) (nop)))
  )
  "type mismatch"
)