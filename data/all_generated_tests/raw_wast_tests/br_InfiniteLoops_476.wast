;; 7. **Test Description**: Implement a nested loop where each loop begins with an unconditional `br` to a specific label outside the loop, ensuring control flow is correctly maintained to exit loops properly. The final loop contains a `br_if` based on dynamic conditions.    **Constraint**: Validates enforcement of structured control.    **Relation to Infinite Loops**: Unstructured jumps or misinterpreted labels can cause control not to exit loops as expected, resulting in infinite execution.

(assert_invalid
  (module
    (func $nested-loop
      (loop $loop1
        (br 1)
        (loop $loop2
          (br 2)
        )
      )
      (loop $loop3
        (br_if 1 (i32.const 0))
      )
    )
  )
  "type mismatch"
)