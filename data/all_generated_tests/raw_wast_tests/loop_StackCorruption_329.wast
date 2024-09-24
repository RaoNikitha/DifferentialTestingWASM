;; 10. Design a test loop which calls another loop, with the inner loop containing branches like `br` and `br_table`. Ensure that branching in inner loops properly unwinds and reinitializes the operand stack, propagating consistent state back to the outer loop without corruption.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (loop (result i32)
          (br 1)
          (br_table 0 1 1 (i32.const 0))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)