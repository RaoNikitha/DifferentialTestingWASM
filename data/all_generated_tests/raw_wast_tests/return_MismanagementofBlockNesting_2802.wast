;; 1. Construct a test with multiple nested blocks where the innermost block includes a `br` instruction to an outer block. Place a `return` instruction inside the innermost block to test if the `return` triggers a correct flow to the outermost block upon being executed. This ensures proper handling of nested block exits.

(assert_invalid
  (module
    (func $nested-blocks-with-return (result i32)
      (block $outer
        (block $inner
          (br $outer)
          (return)
        )
      )
    )
  )
  "unexpected end"
)