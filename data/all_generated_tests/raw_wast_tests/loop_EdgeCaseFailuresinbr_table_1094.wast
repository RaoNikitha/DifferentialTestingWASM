;; 5. **Test Description**:     Create a loop with multiple `br_table` instructions where indices dynamically change within the loop (e.g., conditional updates). Include at least one index that is forcibly set out of bounds dynamically to verify the implementation's runtime handling of such changes.    **Constraint**: Verify dynamic evaluation of index values within `br_table`.    **Relation to `br_table` Edge Cases**: Ensures dynamic index calculations don’t result in mis-branching or crashes.

(assert_invalid
  (module
    (func $complex-loop
      (local $index i32)
      (loop $loop
        (local.set $index (i32.const 0))
        (br_table $loop $default (local.get $index))
        (local.set $index (i32.const 2))
        (br_table $loop $default (local.get $index))
        (block $default)
      )
    )
  )
  "type mismatch"
)