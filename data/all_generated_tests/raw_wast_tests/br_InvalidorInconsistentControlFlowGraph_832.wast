;; 3. Invalid branch within nested if structures:    Design a nested `if` structure where the `br` instruction targets a label that is invalid (either non-existent or escaped outside the nested `if`). This aims to ensure the CFG maintains valid nesting and scope rules.

(assert_invalid
  (module
    (func $invalid-nested-if-branch
      (block
        (if (i32.const 1)
          (then
            (if (i32.const 1)
              (then (br 2))
            )
          )
        )
      )
    )
  )
  "unknown label"
)