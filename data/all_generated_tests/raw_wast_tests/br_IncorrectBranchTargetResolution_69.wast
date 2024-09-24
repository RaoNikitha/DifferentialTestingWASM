;; 10. Create deeply nested `block` constructs and include a `br` instruction to a mid-tier block label. Confirm correct label depth interpretation and ensure exit happens after the specified `end`block.

(assert_invalid
  (module
    (func $test
      (block 
        (i32.const 42)
        (block 
          (block 
            (block 
              (block 
                (block
                  (br 3) 
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)