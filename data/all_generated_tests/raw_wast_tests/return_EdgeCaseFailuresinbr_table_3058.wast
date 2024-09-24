;; Create a chain of nested blocks with `br_table` in the innermost block with an out-of-range index and observe the behavior when unwinding stack up to the function scope, which should magnify any management differences in stack operation.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 42)
      (block
        (block
          (block
            (br_table 2 1 0 (return (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)