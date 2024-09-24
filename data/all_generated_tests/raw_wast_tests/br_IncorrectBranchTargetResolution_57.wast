;; 8. **Test Description: Mid-block Branch**    - Insert a `br` instruction in the middle of a control block to jump to a label further out in the nesting hierarchy.

(assert_invalid
  (module
    (func 
      (block 
        (block 
          (block
            (br 2)
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)