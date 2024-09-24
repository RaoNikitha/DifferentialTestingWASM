;; 10. **Test Description**: Create a test with an outer loop calling a function with its own nested loop. Both loops have independent `br_if` conditions. Ensure correct immediate evaluation to avoid unintended infinite loops within nested structures.     - **Constraint**: Accurate handling and evaluation of nested loops and `br_if` conditions propagated through function calls.     - **Infinite Loop Relation**: Incorrect implementation can cause either the nested loop or the outer loop to run indefinitely,  resulting in an infinite loop.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (call $inner-loop)
        (br_if $outer (i32.const 1))
      )
    )
    (func $inner-loop
      (loop $inner
        (br_if $inner (i32.const 1))
      )
    )
    (call $nested-loops)
  )
  "type mismatch"
)