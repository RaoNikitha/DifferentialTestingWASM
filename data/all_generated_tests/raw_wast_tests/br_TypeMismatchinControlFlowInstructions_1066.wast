;; 7. **Test for Differing Types Between Branch and Block:**    In a scenario where a block expects `i64`, use a `br` instruction to transfer control to the block with only an `f32` value. This tests if mislabeled type assumptions are properly caught and handled.

(assert_invalid
  (module 
    (func 
      (block (result i64) 
        (br 0 (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)