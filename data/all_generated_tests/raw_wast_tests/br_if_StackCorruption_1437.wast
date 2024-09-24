;; A sequence with multiple nested `if` conditions, each containing a `br_if` that references different label indices. Validate that each branch, if taken, correctly unwinds the appropriate stack frames.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (if
              (i32.const 1)
              (then
                (br_if 2 (i32.const 1))
              )
            )
            (br_if 1 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)