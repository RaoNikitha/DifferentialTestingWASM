;; 9. **Test Description**: Configure a nested sequence where an `if` condition evaluates to false and a subsequent `br` still attempts to branch to a non-existent label assuming unconditional flow.    - **Constraint**: This test ensures that the CFG correctly interprets conditional flow and prevents unconditional flow errors.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.eqz (i32.const 0))
        (then (br 1))
      )
    )
  )
  "unknown label"
)