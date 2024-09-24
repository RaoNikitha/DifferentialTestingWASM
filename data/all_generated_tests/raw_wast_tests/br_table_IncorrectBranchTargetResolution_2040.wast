;; ### Summary These test descriptions aim to uncover discrepancies in handling label resolution, operand management, arity checks, and stack operations for the `br_table` instruction, which are critical to ensuring the correct implementation of WebAssembly branching semantics.

(assert_invalid
  (module (func $br_table-type-mismatch (param i32)
    (block (result i64) (i64.const 0) (block (br_table 1 (local.get 0))))
  ))
  "type mismatch"
)