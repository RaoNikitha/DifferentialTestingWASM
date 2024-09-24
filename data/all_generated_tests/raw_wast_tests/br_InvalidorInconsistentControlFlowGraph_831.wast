;; 2. Branch inside an unreachable block:    Create a scenario where a `br` instruction is placed within an unreachable block (e.g., an invalid nested block). Verify if the branch correctly ignores the invalid block and references the nearest valid label. This would test the correct generation of the CFG and stack consistency.

(assert_invalid
  (module
    (func
      (block
        (unreachable)
        (br 0)
      )
    )
  )
  "unreachable executed"
)