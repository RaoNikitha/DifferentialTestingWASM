;; Test 7: Create a block that ends with an unreachable `br_table` instruction. This tests for correct CFG generation by ensuring that these blocks are considered valid even when certain branches will never be executed.

(assert_invalid
  (module (func $block-with-unreachable-br_table
    (block (result i32)
      (i32.const 0)
      (br_table 0 (block (result i32) (unreachable)))
      (i32.const 1)
    )
  ))
  "type mismatch"
)