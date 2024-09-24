;; Construct a `br_table` inside a block that includes an invalid block type that should be caught by type checking (e.g., an incorrect or undefined `blocktype`). This checks if each implementation correctly validates block types before executing branching instructions.

(assert_invalid
  (module (func $invalid-br_table-block-type
    (block (result i32)
      (br_table 0 0 (i32.const 0) (drop))
    )
  ))
  "type mismatch"
)