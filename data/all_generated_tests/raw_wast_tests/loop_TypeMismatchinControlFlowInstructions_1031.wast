;; 2. **Test for Incorrect Nesting Return Types**: Create a `loop` within a `block` where the `loop` has a return type of `[i64] -> [void]`, but the nested `block` has a type mismatch, like `[i32] -> [i32]`. This tests if the context extension correctly checks nested blocks for type conformity.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i64)
          (i32.const 1)
          br 0
        )
      )
    )
  )
  "type mismatch"
)