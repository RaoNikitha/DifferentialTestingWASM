;; 10. Test branching from a nested control structure with the `br` instruction on the topmost `block`:     - **Constraint Checked**: Correct targeting of the outermost block label from deeply nested within.     - **Incorrect Branch Target**: Inaccurate depth interpretation could lead to missing essential block exit points.

(assert_invalid
  (module
    (func $nested-br-targeting
      (block
        (block
          (block
            (br 2)
          )
        )
      )
      (i32.const 0)
    )
  )
  "invalid branch"
)