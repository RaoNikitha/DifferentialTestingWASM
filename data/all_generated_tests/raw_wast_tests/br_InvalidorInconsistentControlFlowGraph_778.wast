;; 9. **Multiple Nested Blocks with Unmatched Forward Branch Targeting:**    - Create multiple nested blocks and an innermost `br` targeting a non-matching forward block label.    - Reasoning: Validates correct interpretation of nested label indexing.    - Relation to CFG: Misinterpretation of labels hinders accurate path creation in the CFG, destabilizing control flow.

(assert_invalid
  (module 
    (func $nested-blocks-unmatched-target 
      (block 
        (block 
          (block 
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)