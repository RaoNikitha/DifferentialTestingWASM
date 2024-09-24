;; Implement a `block` followed by a `loop` with an inner `br_if` targeting the `loop`. Ensure the stack correctly rewinds and the `i32` condition is properly evaluated, reflecting stack polymorphism.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)