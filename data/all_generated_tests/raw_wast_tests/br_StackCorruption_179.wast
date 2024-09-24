;; 10. **Test Description:**     - Develop a scenario with deep nesting involving both forward and backward `br` instructions in a loop context. Make certain that operands required by each branch align with the targeted control structure types and check for consistent stack states to prevent corruption during branching.

(assert_invalid
  (module
    (func $test_deep_nesting
      (block
        (loop
          (block
            (br 2)  ;; Forward branch targeting the outer block
            (block
              (br 3)  ;; Invalid branch, out of bounds
            )
          )
        )
      )
    )
  )
  "invalid branch target"
)