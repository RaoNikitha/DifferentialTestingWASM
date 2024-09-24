;; 10. Construct an `if` instruction with nested `block` instructions, where the blocks internally mismatch their type expectations, e.g., nested blocks expecting `i32` but manipulated as `i64`. This tests for recursive type handling consistency throughout nested blocks.

(assert_invalid
  (module
    (func $nested-block-type-mismatch
      (if (result i32)
        (i32.const 1)
        (then
          (block (result i64)
            (i32.const 2)
            (i64.const 3)
          )
        )
        (else
          (block (result i32)
            (i32.const 4)
          )
        )
      )
    )
  )
  "type mismatch"
)