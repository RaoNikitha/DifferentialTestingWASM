;; 3. Test a `br` instruction within a `loop` that targets `block` outside the loop:    - **Constraint Checked**: Correct branching out of a loop structure.    - **Incorrect Branch Target**: Confusion may lead to re-entering the loop or jumping to an unintended block.

(assert_invalid
  (module
    (func
      (loop
        (block
          (br 1)
        )
      )
    )
  )
  "unknown label"
)