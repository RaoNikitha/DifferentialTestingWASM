;; 3. Nested `block` statements where a `br_if` instruction uses the top of the stack holding a zero value should not branch. The test verifies if the implementation continues rather than erroneously breaking out of the nested block.

(assert_invalid
  (module
    (func $nested-blocks-no-branch (result i32)
      (block
        (block (result i32)
          (i32.const 0)
          (br_if 0)
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)