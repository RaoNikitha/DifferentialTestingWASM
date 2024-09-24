;; 4. **Test for Unnested Loop Targeting:**    - **Description**: A `br` instruction attempting to branch into a loop structure that is not part of the current nesting context.    - **Constraint Checked**: Well-nested control flow enforcement, prohibiting illegal jumps.    - **Relation to CFG**: Verifies the loop targeting correctness, ensuring CFG remains well-nested and logically structured.

(assert_invalid
  (module
    (func $unnested-loop-targeting
      (block (loop (br 1)))
    )
  )
  "undeclared label"
)