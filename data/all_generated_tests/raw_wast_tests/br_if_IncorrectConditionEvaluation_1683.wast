;; 4. **Test Description:** Test a deep nesting scenario where multiple `br_if` instructions are used with varying conditions to ensure each condition is evaluated independently and correctly.    - **Specific Constraint:** Ensure independent condition evaluation in nested `br_if` instructions.    - **Relation to Incorrect Condition Evaluation:** Confirms separation in evaluation logic for each `br_if`.

(assert_invalid
  (module
    (func $deep-nesting-br_if (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (i32.const 0)
                (br_if 0)
                (i32.const 1)
                (br_if 1)
                (i32.const 2)
                (br_if 2)
                (i32.const 3)
                (br_if 3)
                (i32.const 4)
                (br_if 4)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)