;; 6. Include a `br` instruction in a nested block structure wherein the `br` targets an outer nested block’s end. This tests the correct jumping and control flow resumption after the end construct of nested structures.

(assert_invalid
  (module 
    (func (block 
      (block 
        (block 
          (block
            (br 3)
          )
        )
      )
    ))
  )
  "unknown label"
)