;; 3. **Test Description:** Function A calls Function B with nested control structures where a `br` instruction targets a block in Function A.    **Constraint Checked:** Ensure cross-function label resolution by `br`.    **Relation to Function Call/Return Handling:** checks if labels and stack states inside different function calls and their returns are maintained correctly.

(assert_invalid
  (module
    (func $funcA (result i32)
      (block (call $funcB) (result i32))
    )
    (func $funcB
      (block (br 1))
    )
  )
  "unknown label"
)