;; 4. Create a nested structure with mixed blocks and loops, then use a `br` instruction to jump to a loop from within a block further nested. This checks if the engine correctly handles the loop control opening and correctly treats the loop label.

(assert_invalid
  (module
    (func $test
      (block
        (loop $L1
          (block
            (br $L1)
          )
        )
      )
    )
  )
  "label stack polynomial"
)