;; Use an `if-else` structure inside a `block` followed by a `br_if` at the end of the `else`. Check if branching correctly merges the stack states from both `if` and `else` paths and unwinds appropriately.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then (i32.const 2))
          (else
            (i32.const 3)
            (br_if 0 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)