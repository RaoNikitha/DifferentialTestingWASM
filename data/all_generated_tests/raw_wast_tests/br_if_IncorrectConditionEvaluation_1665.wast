;; 6. Test a scenario where the `br_if` instruction aims to exit a sequence of `if` blocks nested within each other, with the condition evaluating to zero. This will expose if any incorrect condition evaluations cause premature exits.

(assert_invalid
  (module
    (func $nested-if-blocks (result i32)
      (block (result i32)
        (if (result i32)
          (then
            (if (result i32)
              (then
                (if (result i32)
                  (then (br_if 0 (i32.const 0)))
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)