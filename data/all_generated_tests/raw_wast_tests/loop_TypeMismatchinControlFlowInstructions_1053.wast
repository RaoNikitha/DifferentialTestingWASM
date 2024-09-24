;; 4. Define a `loop` block that expects results of `[i64]` but the instruction sequence inside ends with an `f32` type value. This checks if both implementations properly validate the resulting types after the loop sequence.

(assert_invalid
  (module
    (func $type-loop-i64-vs-f32 (result i64)
      (loop (result i64)
        (i32.const 42)
        (f32.const 3.14)
      )
    )
  )
  "type mismatch"
)