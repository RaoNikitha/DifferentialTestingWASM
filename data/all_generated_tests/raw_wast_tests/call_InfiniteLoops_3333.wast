;; 2. **Test 2: Nested Loop with Incorrect `br_if` Condition**    - **Constraint:** Ensure `br_if` conditions are correctly evaluated within nested loops.    - **Description:** Construct nested loops where the break condition relies on a function call. Any misinterpretation of the break condition should result in an infinite loop within the nested structure.

(assert_invalid
  (module
    (func $test
      (loop $outer
        (loop $inner
          (call 0)
          (br_if $outer (i32.const 1))
          (br_if $inner (i32.const 0))
        )
      )
    )
    (func (result i32))
  )
  "type mismatch"
)