;; 9. **Test for Type Management in Deeply Nested Control Blocks:**    Define multiple nested blocks with varying expected result types and insert a `br` instruction to the outermost block with an incorrect value type on the stack to observe if nested depth label indexing is respected effectively.

(assert_invalid
  (module
    (func $type-management-deeply-nested-control-blocks
      (block (result i32)
        (block (result i64)
          (block
            (br 2 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)