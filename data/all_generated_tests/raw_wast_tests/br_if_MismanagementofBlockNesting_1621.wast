;; 2. **Test 2**: - **Description**: Nested `if` and `block`, where the `br_if` is inside the `if` and targets the surrounding `block`. - **Constraint Checked**: Ensure `br_if` correctly exits the `block` when conditionally jumping from within the `if`.

(assert_invalid
  (module
    (func
      (block $B1
        (i32.const 1)
        (if
          (then (br_if 1 (i32.const 1)))
        )
      )
    )
  )
  "label index out of bounds"
)