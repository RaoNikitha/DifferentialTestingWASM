;; 7. **Test Description**:    Create a recursive function with branching between recursive calls and include a `return` for base-case simulation. This test verifies if `return` correctly bypasses other recursive calls.    - **Specific Constraint**: Ensures `return` correctly ends recursion and returns from the outer function.    - **Incorrect Branch Target Resolution**: Ensures return labels resolve past recursive branches correctly.

(assert_invalid
  (module
    (func $recursive-with-return (param i32) (result i32)
      (local.get 0)
      (i32.const 0)
      (i32.eq)
      (if (result i32)
        (then
          (return (i32.const 42))
        )
        (else
          (local.get 0)
          (i32.const 1)
          (i32.sub)
          (call $recursive-with-return)
        )
      )
    )
  )
  "type mismatch"
)