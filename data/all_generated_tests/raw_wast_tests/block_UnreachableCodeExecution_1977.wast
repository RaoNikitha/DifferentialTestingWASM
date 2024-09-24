;; 8. **Branch Table Misdirection to Unreachable in Nested Blocks**:    - Integrate a `br_table` within nested blocks, mistakenly mapping to a block containing an `unreachable` due to incorrect label analysis during context extension. This tests if `br_table` effectively resolves all targets correctly.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (unreachable)
            (br_table 0 0 0)
          )
        )
      )
    )
  )
  "type mismatch"
)