;; 2. Place an `unreachable` instruction within a block that contains a `br_table` which is meant to branch outside the block. This test checks if the `unreachable` will still cause an unconditional trap interrupting the execution despite the `br_table` being present.

(assert_invalid
  (module (func $branch_table_unreachable (block (unreachable) (br_table 0) (i32.const 0))))
  "type mismatch"
)