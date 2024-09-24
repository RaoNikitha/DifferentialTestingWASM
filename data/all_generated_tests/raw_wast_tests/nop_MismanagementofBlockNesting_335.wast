;; 6. **Test with Blocks Ending with `nop`**:     - Construct nested blocks where each block finishes with a `nop` instruction just before the end. Validate that the outer block execution resumes correctly after inner block completion.    - This ensures the `nop` at the end of a block doesn't confuse the control flow logic when returning to an outer context.

(assert_malformed 
  (module 
    (func $test 
      (block 
        (block 
          (block 
            (nop)
          )
          (nop)
        )
        (nop)
      )
    )
  )
  "malformed block with nop"
)