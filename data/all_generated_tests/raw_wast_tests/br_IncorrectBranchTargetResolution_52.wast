;; 3. **Test Description: Nested Blocks With Irregular Patterns**    - Design a structure with irregular patterns of nested `block` and `loop` instructions and use a `br` instruction to jump several layers back.

(assert_invalid
  (module 
    (func $nested-blocks-irregular
      (block (block (loop (block (br 3)))))
    )
  )
  "unknown label"
)