;; 4. Test Description: **Outward Branching from Nested Conditions**    - Develop deep nesting with `if` within `if` and `block` structures, placing a `br` to exit multiple levels outwards. Validate if the correct outermost block or conditional structure is reached.    - Constraint: Validates an outward branch for correct control flow adherence across nested conditions.

(assert_invalid
  (module
    (func $complex-nested-branch
      (block
        (block
          (if (result i32)
            (then
              (if (result i32)
                (then
                  (br 2)
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