;; 5. Forward branch to a block-observed result type mismatch:    Formulate a test case with a structured `block` expecting specific result types, and include a `br` instruction that incorrectly fulfills this type requirement before the `end`. This will test how CFG handles type checking within branching constructs.

(assert_invalid
  (module (func $forward-branch-block-mismatch
    (block (result i32)
      (br 0)
      (i32.const 1)
    )
  ))
  "type mismatch"
)