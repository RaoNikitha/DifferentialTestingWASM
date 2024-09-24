;; Test 8: A `loop` block with a type `(param i32) (result i32)` but it contains instructions with an unexpected intermediate `br_if` that manipulates `f32` instead of `i32`. This evaluates the type checking during conditional jumps in loops.

(assert_invalid
  (module
    (func $loop-type-mismatch
      (i32.const 0)
      (loop (param i32) (result i32)
        (f32.const 0.0)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)