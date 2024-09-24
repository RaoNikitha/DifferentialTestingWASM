;; 8. Construct a loop where each iteration involves a function call returning a boolean value used in the `br_if` condition. Ensure the loop exits only when the function returns `true`. This checks whether conditions involving function return values are properly evaluated.

(assert_invalid
  (module
    (func $cond (result i32)
      i32.const 0
    )
    (func (result i32)
      (loop (result i32)
        call $cond
        br_if 1
      )
    )
  )
  "type mismatch"
)