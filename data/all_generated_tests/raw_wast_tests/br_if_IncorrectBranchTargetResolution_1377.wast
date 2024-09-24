;; 8. **Test Description 8: Complex Conditional Branch with Miscounted Labels**    - Formulate a mix of `if` and `block` constructs, use `br_if` within a loop target to determine if the branch correctly references the appropriate label according to its nesting position.

(assert_invalid
  (module
    (func $complex-conditional-branch
      (block
        (loop
          (block
            (if 
              (i32.eqz (i32.const 0)) 
              (then 
                (br_if 1 (i32.const 1)) 
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)