;; 10. **Improperly Nested Branch Test**: Construct a set of nested structures where a `br` instruction tries to branch to a label that improperly nests within another independent structure, such as misaligning an `if` block’s branch to a nested `loop`. This tests whether the implementation manages improper nesting violations.

(assert_invalid
  (module (func $improperly-nested-branch-test
    (block
      (if (i32.const 1)
        (block
          (loop
            (br 3)
          )
        )
      )
    )
  ))
  "unknown label"
)