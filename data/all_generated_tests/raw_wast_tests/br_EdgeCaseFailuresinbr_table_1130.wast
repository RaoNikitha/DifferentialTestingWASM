;; 1. **Immediate Bounds Check:**    - Test to see if the `br_table` instruction handles an index that is exactly equal to the number of targets. This checks if the code correctly identifies and handles the boundary condition where the index is out of bounds.    - **Constraint:** Ensures labels are correctly bounded by the number of available targets.

(assert_invalid
  (module
    (func $immediate-bounds-check
      (block $label0
        (br_table 0 1 (i32.const 1))
      )
    )
  )
  "index out of bounds"
)