;; 5. **Test Description**:     Construct a nested block structure where an `if` branch inside the block contains a `call_indirect` that references multiple functions with similar signatures but different parameter counts. Use `br_table` within the nested blocks to test branching behavior.    **Constraint**: Check that the `br_table` correctly interprets the nested block depths and that the `call_indirect` respects the function signatures as expected.    **Relation to Mismanagement of Block Nesting**: Validates the correct interpretation of block depths and function type conformance within nested structures.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func (param i32) (result i32)
      (block (result i32)
        (i32.const 1)
        (br_table 0 0)
        (if (result i32)
          (i32.const 42)
          (call_indirect (type 0) (i32.const 1) (i32.const 10))
        )
      )
    )
  )
  "type mismatch"
)