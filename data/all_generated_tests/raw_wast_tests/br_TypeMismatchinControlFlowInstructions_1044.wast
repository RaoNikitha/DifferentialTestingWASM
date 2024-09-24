;; 5. Create a `block` with an expected type of `i64`. Inside this block, place another block that unconditionally branches out with a `br` instruction where the operand type mistakenly is `i32`. This will ensure type consistency in branches breaking out of nested blocks.

(assert_invalid
  (module
    (func $incorrect-type-in-branch
      (block (result i64)
        (block
          (i32.const 42)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)