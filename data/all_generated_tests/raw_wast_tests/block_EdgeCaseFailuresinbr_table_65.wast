;; 6. **Test with `br_table` on Non-local Target**:    - A `block` with `br_table` targeting a label not within the scope of the immediate `block`.    - Examines if the `br_table` respects the local label context without incorrectly referencing unreachable labels.    - Edge Case: Wizard_engine’s initialization logic may not maintain proper scoping, leading to potential out-of-scope label references.

(assert_invalid
  (module (func $br_table_non_local_scope
    (block (br_table 1 (i32.const 0))))
  )
  "unknown label"
)