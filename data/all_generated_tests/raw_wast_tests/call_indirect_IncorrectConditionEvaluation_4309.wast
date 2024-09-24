;; 8. **Multiple Function Types in Table**:    Include multiple function types in a single table and use `call_indirect`. Ensure that calls match the appropriate types and invalid matches trap. This confirms that both implementations correctly handle multiple types.      **Constraint**: Validate handling of multiple function types within a single table.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (func $f1 (param i32) (result i32) (i32.const 0))
    (func $f2 (param i32) (nop))
    (table funcref (elem $f1 $f2))
    (func $test (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0) (i32.const 1))
    )
  )
  "type mismatch"
)