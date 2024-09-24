;; 4. **Test Description:**    Design a deeply nested control structure (`block` > `if` > `loop`) with a `br_if` that uses a condition based on multiple arithmetic expressions. Validate each step ensures correct condition handling.    - **Constraint Checked:** Correct condition evaluation in deeply nested control structures.    - **Relation to Incorrect Condition Evaluation:** Ensures complex conditions are evaluated correctly to avoid erroneous branching.

(assert_invalid
  (module
    (func $deeply_nested_arithmetic_conditional
      (block
        (i32.const 3)
        (if
          (then
            (loop
              (block
                ;; Arbitrary arithmetic expressions
                (i32.const 10)
                (i32.const 20)
                (i32.add)   ;; 30
                (i32.const 2)
                (i32.div_s) ;; 15
                (br_if 1 (i32.const 0)) ;; Target outer block if condition is true
              )
              (br 0) ;; Loop continuation to ensure it’s backward branch
            )
          )
        )
      )
    )
  )
  "type mismatch"
)