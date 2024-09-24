;; 9. **Test `nop` with Conditional Calling Across Module Boundaries**:    - **Constraint Checked**: Ensures conditional logic with `nop` does not disrupt cross-module calls.    - **Description**: Within an exported function, use an `if-else` block to conditionally call imported functions with `nop` instructions placed both inside and outside the block. Observe for control flow discrepancies during testing.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (export "test_func")
      (if (i32.const 1)
        (then
          (call $external_func)
          (nop)
        )
        (else
          (nop)
          (call $external_func)
        )
      )
    )
  )
  "invalid type"
)