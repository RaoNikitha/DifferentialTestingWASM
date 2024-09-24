;; Use nested blocks with multiple `br_table` instructions to branch based on different indices. This tests the handling of multiple levels of block types and context, which can reveal inconsistencies in label index management between the two implementations.

(assert_invalid
  (module (func $block-br_table-nested-mismatch (result i32)
    (block $outer (result i32)
      (block $inner (result i64)
        (br_table 0 1 2 (i32.const 0))
      )
      (i32.const 42)
    )
  ))
  "type mismatch"
)