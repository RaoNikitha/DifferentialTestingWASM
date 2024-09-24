;; 1. **Test Description:**    - Create a test where a deeply nested loop structure with multiple `br` instructions should correctly jump to an outer loop. Specifically test where the deepest loop repeatedly uses `br` to exit to the outer loop.    - **Constraint:** This test checks for the correct interpretation of relative label indices in nested structures to ensure there's no infinite loop due to misinterpreted labels.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block (br 2))  ;; This should correctly target the outer block
          (loop
            (br 1)       ;; This should also target the outer block
          )
        )
      )
    )
  )
  "unknown label"
)