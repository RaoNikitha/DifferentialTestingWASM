;; - Create a function with conditional branches and a return statement inside one of the conditional blocks. Check if the return indeed exits the function or leads to an incorrect block target, leaving some code paths unexecuted.

(assert_invalid
  (module
    (func $conditional-return (result i32)
      (if (i32.const 1)
        (then
          (drop (i32.const 42))
          (return)
        )
        (else
          (drop (i32.const 24))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)