;; 1. Create a nested block structure where a `call_indirect` instruction is used within an inner block, but the `br_table` instruction incorrectly jumps to an outer block. Verify that both implementations handle the depth correctly and trap appropriately if needed.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $type-mismatch)
    (func $type-mismatch (param i32) (result i32) (i32.const 1))
    (func $nested-block-test
      (block (block (block
        (call_indirect (type 0) 
          (i32.const 0)
          (block (br_table 0 1)
            (i32.const 42)
          )
        )
      )))
    )
  )
  "type mismatch"
)