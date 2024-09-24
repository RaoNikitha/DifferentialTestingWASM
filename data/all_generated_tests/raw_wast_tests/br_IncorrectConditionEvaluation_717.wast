;; 8. **Test: Complex Expression Evaluation in `br_if` Conditions**    - **Description:** Create a test where the condition for `br_if` is a complex expression involving multiple arithmetic and logical operations. The `br_if` should only branch if the entire expression evaluates to true.    - **Constraint:** Ensure that the complex expression is correctly evaluated, and `br_if` branches according to the final result, testing the accuracy of condition evaluation.

(assert_invalid
  (module
    (func $complex-br-if
      (block 
        (br_if 0 
          (i32.or 
            (i32.and (i32.const 1) (i32.const 1)) 
            (i32.xor (i32.const 0) (i32.const 1))
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)