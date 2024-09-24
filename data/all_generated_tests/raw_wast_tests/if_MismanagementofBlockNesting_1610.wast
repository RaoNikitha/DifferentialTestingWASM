;; 1. **Test for Nested `if` Inside `if` Without `else`**: Create a sequence where an `if` block contains another `if` block without `else`. This checks if the deeper `if`'s `end` is properly matched and the outer `if` resumes control flow correctly.

(assert_invalid
  (module
    (func $nested_if_without_else
      (if (i32 const 1)
        (then 
          (if (i32.const 0)
            (then (nop))
          ) 
        )
      )
    )
  )
  "type mismatch"
)