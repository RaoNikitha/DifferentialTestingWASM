;; Construct a sequence of `if-else` blocks with complex nesting and use `br` to branch to the outermost `if-else` incorrectly, verifying if the branch target resolution adheres to the correct nesting constraints.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (block (result i32)
            (if (result i32)
              (i32.const 1)
              (i32.add (i32.const 1) (i32.const 2))
              (br 2 (i32.const 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)