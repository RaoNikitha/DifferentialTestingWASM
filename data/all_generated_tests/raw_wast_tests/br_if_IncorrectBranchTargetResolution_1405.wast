;; 6. **Test Description**: Implement an `if` structure that branches with `br_if` depending on an external condition to a natural `block` enclosing another `if`. Validate the target resolution.    - **Constraint Checked**: Label handling across multiple levels of nested `if` and `block`.    - **Related Issue**: Ensure that nested `if` statements do not interfere with outer `block` label indexing.

(assert_invalid
  (module
    (func $nested-br_if
      (block $outer 
        (block $middle
          (if (i32.const 1)
            (then 
              (br_if 1 (i32.const 1))) 
            (else
              (br_if 0 (i32.const 0))))
          )
        )
      )
    )
  )
  "type mismatch"
)