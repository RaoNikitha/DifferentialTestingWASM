;; 9. A `br_if` in a nested `if-else` structure where the condition is the outcome of a lookup function call result in an `i32`. Ensures branching corresponds precisely to the function call result.

(assert_invalid
  (module
    (func (block (block
      (if (i32.const 1)
        (then (br_if 1 (call $some_function)))
        (else (nop))
      )
    )))
    (func $some_function (result i32)
      (i32.const 1)
    )
  )
  "type mismatch"
)