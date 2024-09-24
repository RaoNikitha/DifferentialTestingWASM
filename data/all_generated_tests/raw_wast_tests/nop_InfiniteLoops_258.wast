;; 9. **Test Description**: Formulate nested loops with `nop` instructions placed randomly between other control flow instructions (`block`, `loop`) to verify proper nest handling.    - **Constraint**: Ensures that nested structures handle `nop` without any adverse effect.    - **Relation to Infinite Loops**: Ensures that nested loops exit as expected without being caught in unexpected infinite loops.

(assert_invalid
  (module
    (func $nested_loops
      (block (loop (nop) (br 1)))
      (loop (block (nop) (br 1)))
    )
  )
  "type mismatch"
)