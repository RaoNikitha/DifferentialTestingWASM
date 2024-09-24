;; 3. **Test: Nested `br_if` with Varying Conditions**    - **Description:** Create a test with nested conditional branches using `br_if`. The innermost `br_if` should have a condition that evaluates to true, while the outer `br_if` has a condition that evaluates to false.    - **Constraint:** Check that each `br_if` independently evaluates its condition and branches correctly, ensuring accurate condition evaluation in nested contexts.

(assert_invalid
  (module
    (func $nested-br_if (result i32)
      (block (result i32)
        (i32.const 0)
        (block (result i32)
          (i32.const 1)
          (br_if 0 (i32.const 1))  ;; This should branch to the end of the innermost block
          (br_if 1 (i32.const 0))  ;; This should not branch
        )
        (i32.const 2)  ;; Code to execute if the second br_if does not branch
      )
    )
  )
  "type mismatch"
)