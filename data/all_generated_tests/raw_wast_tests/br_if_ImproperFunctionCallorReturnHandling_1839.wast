;; - A function with `br_if` inside an `if-else` structure that conditionally leads to a return inside each branch. This setup tests whether improper function calls and returns are handled correctly when conditional branches are involved in the stack control flow.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (then
          (br_if 0 (i32.const 1))
          (return (i32.const 1))
        )
        (else
          (br_if 0 (i32.const 0))
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)