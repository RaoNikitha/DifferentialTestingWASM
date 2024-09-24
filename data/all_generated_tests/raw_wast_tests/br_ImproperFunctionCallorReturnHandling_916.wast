;; 7. Test Description: Design a test wherein a function call stack is managed through nested `block` instructions, and a `br` instruction improperly unwinds the stack to an incorrect state, leading to improper subsequent calls or returns.

(assert_invalid
  (module
    (func $nested_blocks
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 42)
            (br 3) ;; Jump out of nesting levels improperly
            (i32.const 10)
          )
        )
      )
    )
  )
  "unknown label"
)