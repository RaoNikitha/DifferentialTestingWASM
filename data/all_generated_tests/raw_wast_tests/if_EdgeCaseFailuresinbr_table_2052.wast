;; 3. **Empty `br_table` in a Conditional Block**:    - Create an `if` block that contains a `br_table` with no valid jump targets (empty table). The test aims to verify how both frameworks handle scenarios where `br_table` has to deal with an empty target list, checking for consistent initialization and error reporting.

(assert_invalid
  (module
    (func
      (if (result i32)
        (i32.const 1)
        (then
          (block (br_table))
        )
      )
    )
  )
  "type mismatch"
)