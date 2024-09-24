;; 8. **Test 8: Return in Br Table with Mixed Types**    - Implement a `br_table` branching to labels with varying return points, ensuring return statements manage stack heights/types correctly despite jumps.    - *Related Constraint*: Ensures stack consistency with complex control flow involving `return`.

(assert_invalid
  (module
    (func $return-in-br_table-mixed-types
      (block $label0
        (block $label1 (i32.const 42) (br_table 0 1 (return)))
        (return)
      )
    )
  )
  "type mismatch"
)