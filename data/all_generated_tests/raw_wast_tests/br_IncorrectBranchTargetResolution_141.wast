;; Create a nested block and a loop where the `br` instruction in the inner block targets the label intended for the outer block to see if the label's relative index is misinterpreted, leading to incorrect branching.

(assert_invalid
  (module
    (func $nested-block-loop
      (block 
        (loop
          (block 
            (br 2)
          )
        )
      )
    )
  )
  "invalid label"
)