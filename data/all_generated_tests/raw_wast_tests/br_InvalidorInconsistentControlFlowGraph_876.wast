;; 7. **Intermediate Block Branching:**    - Test a scenario where a `br` instruction inside a nested `block` targets an intermediate outer `block`.    - Examines whether the CFG correctly unwinds structured control instruction layers and maintains proper flow among nested blocks.

(assert_invalid
  (module
    (func $intermediate-block-branching
      (block
        (block
          (block
            (br 1)
          )
        )
      )
    )
  )
  "invalid label"
)