;; Test 8: Create a `br_table` instruction where the index specifies a target deep within nested blocks, pushing the nesting constraints to their limits. This checks if the implementation properly manages complex control flow.

(assert_invalid
  (module
    (func $deep-nested-control
      (block (block (block (block (block 
        (br_table 0 1 2 3 4 (i32.const 5))
      )))))
    )
  )
  "unknown label"
)