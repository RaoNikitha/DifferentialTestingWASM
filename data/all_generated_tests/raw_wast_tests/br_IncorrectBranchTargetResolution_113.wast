;; 4. Test nested `loop` structures where a `br` targets an outer `loop` label:    - **Constraint Checked**: Appropriate backward jump to the beginning of the intended outer loop.    - **Incorrect Branch Target**: If indexing is incorrect, the jump may erroneously target the inner loop.

(assert_invalid
  (module
    (func $nested-loops-target-outer-loop
      (loop
        (loop
          (br 1)
        )
      )
    )
  )
  "invalid branch target"
)