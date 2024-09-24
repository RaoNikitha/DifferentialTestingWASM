;; 3. **Nested Loop with Unconditional Branch to Outermost Loop**:    - Test Description: Construct a module with multiple nested loops where an innermost loop branches unconditionally (`br 2`) to the outermost loop.    - Constraint: Check that the branch effectively jumps out of multiple nested levels to the correct loop.    - Relation: This test stresses the label management system by requiring proper resolution across multiple nesting levels, potentially uncovering depth mismanagement issues.

(assert_invalid
  (module
    (func $nested-loop-unconditional-branch
      (loop $outer (block (loop $inner (br 2))))
    )
  )
  "type mismatch"
)