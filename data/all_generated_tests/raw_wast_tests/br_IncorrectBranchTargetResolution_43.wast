;; 4. Use a `br` instruction to target an outer `block` from within a nested `if` inside multiple `blocks`. This verifies correct outward branching to the appropriate `block`, ensuring **correct outward branching behavior**.

(assert_invalid
  (module
    (func $outward-branch-from-nested-if
      (block
        (block
          (block
            (if
              (then (br 2))
            )
          )
        )
      )
    )
  )
  "unknown label"
)