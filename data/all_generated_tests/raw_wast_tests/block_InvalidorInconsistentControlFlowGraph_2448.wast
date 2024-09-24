;; 9. **Test Invalid Forward Branch Beyond End**:    - Description: Create a scenario where a `br` or `br_if` inside a block attempts to branch forward beyond the `end` of the block.    - Constraint: Ensure forward branches are accurately resolved within the block scope.    - CFG Relevance: Invalid forward branches can cause the CFG to reference non-existent paths, corrupting execution flow.

(assert_invalid
  (module (func $invalid-forward-branch-beyond-end
    (block
      (br 1)
      (nop)
    )
  ))
  "invalid forward branch"
)