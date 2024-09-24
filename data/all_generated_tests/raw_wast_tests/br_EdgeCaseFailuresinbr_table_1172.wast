;; 3. Use a `br_table` instruction within deeply nested control structures to verify that label indices are correctly interpreted in such contexts, specifically when the index values are near the boundary of valid ranges.

(assert_invalid
  (module
    (func (param i32) 
      (block 
        (loop 
          (block 
            (loop 
              (block 
                (br_table 0 1 2 3 (local.get 0))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)