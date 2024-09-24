;; 5. **Test Invalid Branch in Else Block**:    Design an `if-else` structure where the `else` block contains a branch that targets a deeper enclosing label. Validate the resolution of this target while ensuring stack type conformity and avoiding misinterpretation of non-local branches.

(assert_invalid
  (module
    (func (result i32)
      (block $outer
        (i32.const 1)
        (if (result i32)
          (then (i32.const 0))
          (else (br $outer (i32.const 0)))
        )
      )
    )
  )
  "type mismatch"
)