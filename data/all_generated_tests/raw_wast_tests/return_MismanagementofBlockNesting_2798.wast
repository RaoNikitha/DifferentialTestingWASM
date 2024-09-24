;; 7. Test a nested block structure involving multiple nested conditional checks interchangeably with loops, and place the `return` within the innermost loop. Verify that `return` correctly exits the function, ignoring intervening nested conditions.

(assert_invalid
  (module
    (func $nested-blocks-with-return (result i32)
      (block
        (block
          (i32.const 42)
          (if 
            (i32.const 1)
            (then
              (loop
                (return)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)