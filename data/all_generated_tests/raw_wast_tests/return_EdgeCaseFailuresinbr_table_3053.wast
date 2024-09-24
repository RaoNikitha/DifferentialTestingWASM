;; Create a `br_table` instruction where the index is a negative value, which is invalid. This tests if the `Wizard Engine` handles unreachable states and resets stack pointers correctly, and if WebAssembly invalidates this stack context.

(assert_invalid
  (module
    (func $test-br_table-negative-index (result i32)
      (i32.const -1)
      (block (br_table 0 (return)))
    )
  )
  "type mismatch"
)