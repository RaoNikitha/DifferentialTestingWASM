;; Test 4: - Design a control flow with a deeply nested `block` structure where `br_if` targets a mid-level block (label `3`). Monitor if both implementations correctly resolve to the intended block. - **Constraint Checked**: Relative Lookups and Nesting Depth. - **Relation to Incorrect Branch Target Resolution**: Ensures labels are resolved based on proper nesting depth calculations.

(assert_invalid
  (module
    (func $nested-br_if
      (block
        (block
          (block
            (block
              (block
                (br_if 3 (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)