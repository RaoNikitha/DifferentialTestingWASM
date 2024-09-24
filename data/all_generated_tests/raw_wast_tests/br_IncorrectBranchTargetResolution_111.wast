;; 2. Test a `br` instruction targeting an outer `block` label within nested `if` and `block` instructions:    - **Constraint Checked**: Correct relative indexing amidst mixed control structures.    - **Incorrect Branch Target**: Misinterpretation of relative indexing could cause jumping to an `if` branch rather than the `block`.

(assert_invalid
  (module
    (func $mixed-control-structures
      (block
        (if (block (br 1)))
      )
    )
  )
  "unknown label"
)