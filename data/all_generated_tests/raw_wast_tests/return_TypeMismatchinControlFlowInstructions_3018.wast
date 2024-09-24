;; Validate a function that uses a `select` instruction within a `block` followed by a `return`, where the selected type does not match the expected return type of the function.

(assert_invalid
  (module
    (func $type-mismatch-select-in-block-return (result i32)
      (local i32)
      (block
        (select (i32.const 1) (i32.const 2) (i32.const 0))
        (return (i32.const 0))
      )
    )
  )
  "type mismatch"
)