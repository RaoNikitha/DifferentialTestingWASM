;; 9. **Invalid Branching to Outer Blocks**:    Structure nested blocks where a branch intends to jump beyond the outermost block. This test confirms whether the implementation accurately restricts branch targets to valid enclosing blocks only.

(assert_invalid
  (module (func $invalid-branch-outer (block (block (block (br 3)))))
  )
  "unknown label"
)