;; 8. **Deeply Nested Loops with Complex Branching**:    - Description: Construct multiple nested loops with branches targeting various depth levels. Verify correct branch target resolution in deeply nested contexts.    - Reasoning: Tests handling and resolution of branches in complex nesting scenarios.

(assert_invalid
  (module (func $deeply-nested-loops (result i32)
    (loop (result i32)
      (loop (result i32)
        (block $label0 (br 1))  ;; Branch to the outer loop
        (loop (result i32) 
          (block $label1 (br 2))  ;; Branch to the first loop, skipping the outer-most loop
          (loop (result i32) 
            (br 3)  ;; Branch to the start of the function, invalid in this context
          )
        )
      )
    )
  ))
  "type mismatch"
)