;; 1. **Test Description:**    Verify if a `br` instruction inside a nested block incorrectly labels inner block labels and causes an improper branch exit. This test checks if mislabeled inner blocks result in incorrect condition evaluations causing branching decisions that skip intermediate block executions.

(assert_invalid
  (module
    (func $nested-br-mislabel (result i32)
      (block
        (block
          (block (result i32)
            (i32.const 1)
            (br 2)
            (i32.const 0)
          )
          (br 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)