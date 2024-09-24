;; 9. **Test 9**: Create different nested structures with multiple `block` and `loop` constructs. Use a `br` instruction to target one of these mid-nested blocks or loops. Specifically verify if the branching respects the relative label lookup and performs appropriate stack operations.

(assert_invalid
  (module
    (func $nested-branch 
      (block
        (loop 
          (block 
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)