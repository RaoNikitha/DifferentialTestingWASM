;; Include a `br_table` instruction inside a loop where the table contains multiple branches to different depths to check if the CFG correctly interprets indirect branching.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1)
        (block (result i32) (i32.const 0) (br_table 0 1))
      )
    )
  )
  "type mismatch"
)