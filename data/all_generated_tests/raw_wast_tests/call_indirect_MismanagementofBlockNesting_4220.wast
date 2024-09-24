;; 9. **Test Description**:     Construct a test with deeply nested blocks containing `call_indirect` instructions. Implement `br_table` at various depths to test correct block exit paths when functions are called indirectly.    **Constraint**: Ensure that `br_table` correctly navigates the nested block depths and the `call_indirect` instructions handle dynamic type checks without causing control flow errors.    **Relation to Mismanagement of Block Nesting**: Confirms that deep nesting with function calls and branching maintains proper control flow management and type checking.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32 i32))
    (func $nested-blocks
      (block (block (block
        (br_table 0 1 2 
          (call_indirect (type 0) (i32.const 0) (i32.const 0) (i32.const 1))
        )
      )))
    )
  )
  "type mismatch"
)