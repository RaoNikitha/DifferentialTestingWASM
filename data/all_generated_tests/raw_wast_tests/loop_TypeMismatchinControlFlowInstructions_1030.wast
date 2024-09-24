;; 1. **Test for Incorrect Parameter Layout in Loop**: Design a `loop` where the initial block type is `[i32, f64] -> [f32]`, but the sequence of instructions within the loop ends with `[i32, i32]` instead. This will check if type mismatches between declared input/output types and actual instruction sequences within `loop` are caught.

(assert_invalid
  (module
    (func $test-loop
      (loop (result f32) (param i32 f64)
        (i32.const 1)
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)