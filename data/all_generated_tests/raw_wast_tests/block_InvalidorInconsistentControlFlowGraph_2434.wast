;; 5. **Test for Nested Blocks with Improper Branch**:    - Nest multiple `block` instructions and include a `br` instruction targeting an intermediate nested block that has already ended. This assesses the handling of nested scopes.    - Constraint: Nested block handling and branching.    - CFG Impact: CFG misinterpretation with misaligned branch targets within nested blocks.

(assert_invalid
  (module (func $nested-blocks-improper-branch
    (block (block (block (br 2)) end) end)
  ))
  "type mismatch"
)