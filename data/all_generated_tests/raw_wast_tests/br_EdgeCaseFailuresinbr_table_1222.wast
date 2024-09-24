;; 3. **Single Label with Multiple Indices:**    - Description: Use a `br_table` with a single target label but various indices referencing it.    - Check whether all indices correctly resolve to the singular target.    - Specific Constraint: Verify that multiple indices correctly map to the single defined label.

(assert_invalid
  (module
    (func (block (br_table 0 0 0 0 (i32.const 2))))
  )
  "unknown label"
)