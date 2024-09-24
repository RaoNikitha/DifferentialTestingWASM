;; 1. Call a function within a loop where the function's return type mismatches the expected type of the loop's continuation value.

(assert_invalid
  (module
    (func $type-mismatch-loop (result i32)
      (loop $loop (result i32)
        (call $mismatch-func)
        br_if $loop (i32.const 1)
      )
    )
    (func $mismatch-func (result f32)
      (f32.const 0.0)
    )
  )
  "type mismatch"
)