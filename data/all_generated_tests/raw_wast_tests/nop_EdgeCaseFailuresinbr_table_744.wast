;; 5. **Test Description**: Form a sequence where `nop` is repeatedly followed by `br_table` with an index larger than the count of available labels.    - **Constraint**: Validating that multiple `nop` instructions do not disturb the `br_table` index processing.    - **Edge Case**: Testing `br_table`’s handling of out-of-bound indices and ignoring `nop`.

(assert_invalid
  (module 
    (func $nested-br_table
      (block $l0
        (nop)
        (nop)
        (br_table 1 (i32.const 0))
        (br_table 1 (i32.const 1))
      )
    )
  )
  "unknown label"
)