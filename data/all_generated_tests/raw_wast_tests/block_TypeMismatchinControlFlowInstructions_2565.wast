;; 6. **Test Description**:    Use a block that consumes stack values of one type but produces mismatched output types defined in the block type, and verify that this causes a type error.    **Constraint:** Matching produced output types with block type declaration.    **Relation to Type Mismatch:** Ensures output types conform to the block's type constraints.

(assert_invalid
  (module (func $type-block-mismatch (result i32)
    (block (result i32)
      (i64.const 42)
      (i32.const 0)
    )
  ))
  "type mismatch"
)