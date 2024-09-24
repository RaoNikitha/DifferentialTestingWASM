;; 6. **Nested Structure with Type Mismatch on Block Exit:**    Nested `loop` within a `block`, with `br_table` misconfigured so that breaking out from the loop to the block has a mismatched operand type. This checks for proper management of type consistency across structured blocks.

(assert_invalid
  (module
    (func $nested-structure-type-mismatch
      (block (result i32)
        (loop
          (br_table 0 1 (i32.const 0) (i64.const 0))
        )
      )
    )
  )
  "type mismatch"
)