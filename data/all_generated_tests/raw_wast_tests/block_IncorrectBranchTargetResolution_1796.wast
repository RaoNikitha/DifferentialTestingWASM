;; 7. **Test Description**: A `block` instruction within another `block` where a `br` targets an intermediate block rather than the outermost block.    **Reasoning**: Examines label stack consistency when branching not to the immediate enclosing block but to an intermediate nesting level.

(assert_invalid
  (module
    (func $nested-block-branch (result i32)
      (block
        (block
          (block
            (br 1)
            (i32.const 0)
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)