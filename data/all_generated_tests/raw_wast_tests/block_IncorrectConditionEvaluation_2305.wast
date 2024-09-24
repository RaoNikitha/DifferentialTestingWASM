;; 6. Chain a series of blocks where each has a `br_if` depending on the previous block's result to find if incorrect branching cascades through nested block structures.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (br_if 1 (i32.const 1))
          (i32.const 0)
        )
        (i32.const 0)
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)