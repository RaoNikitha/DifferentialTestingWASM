;; 6. Create a structure with several `blocks` nested within each other, with a `br_table` instruction within the innermost block, targeting a higher-level block. Verify that the `br_table` evaluates the correct target and jumps to the specified block without misaddressing. This checks the correct implementation of `br_table` with nested blocks.

(assert_invalid
  (module
    (func $nested-br-table 
      (block 
        (block 
          (block 
            (block 
              (br_table 2 1 0 (i32.const 3))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)