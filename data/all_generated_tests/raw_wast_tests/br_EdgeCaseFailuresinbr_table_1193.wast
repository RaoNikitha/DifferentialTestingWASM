;; 4. Test a `br_table` instruction with an empty target list, which should result in an immediate default action or error since there are no valid targets to branch to. This examines handling of empty branch target lists.

(assert_invalid
  (module (func $empty-br_table (block (result i32) (br_table 0 (i32.const 0)))))
  "invalid label index"
)