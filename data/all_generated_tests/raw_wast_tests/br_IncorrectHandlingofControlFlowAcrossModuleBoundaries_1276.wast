;; 7. **Test of Deeply Nested Function Calls:**    - Implement a function in module A that involves deep nesting of `block` and `br` instructions, with calls to imported functions from module B at different nesting levels. This aims to test if deep control flows with external calls maintain stack integrity.    - **Constraint Checked:** Accurate handling of deeply nested blocks and label indexing with cross-module calls.    - **Relation to Constraint:** Validates that stack operations are correctly performed in deeply nested structures during cross-module transitions.

(assert_invalid
  (module
    (import "moduleB" "funcB" (func $funcB))
    (func $deepNesting
      (block
        (block
          (block
            (call $funcB)
            (br 2)
          )
          (call $funcB)
          (br 1)
        )
        (call $funcB)
        (br 0)
      )
      (call $funcB)
    )
  )
  "type mismatch"
)