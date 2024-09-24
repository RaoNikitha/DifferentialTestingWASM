;; 1. Test Description: **Deeply Nested Blocks with Cross-Branching**     - Test multiple nested blocks where `br` instruction targets a mid-level block from the innermost block. Validate if the control flow correctly exits to the middle block, ensuring no misinterpretation of relative label indices.    - Constraint: Validates correct relative label indexing and block nesting management.

(assert_invalid
  (module
    (func $deeply_nested_blocks
      (block
        (block
          (block
            (block
              (br 2)
            )
          )
        )
      )
    )
  )
  "unknown label"
)