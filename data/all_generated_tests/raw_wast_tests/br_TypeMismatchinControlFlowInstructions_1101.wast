;; 2. **Test for Invalid Operand in Loop Branch**: Construct a `loop` that expects an `i32` as the input type but execute a `br` to this loop with an `f32` operand on the stack. This should correctly be flagged as a type mismatch error in strict implementations but could be mishandled if type checks are not enforced.

(assert_invalid
  (module
    (func (param f32)
      (block
        (loop (result i32)
          (br 0 (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)