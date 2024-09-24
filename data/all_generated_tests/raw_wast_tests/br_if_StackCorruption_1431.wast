;; A `loop` structured block that consumes a `i32` and an `i64`. Place a `br_if` that conditionally jumps to the loop start. Test to ensure the stack correctly rewinds and re-pushes both values.

(assert_invalid
  (module (func $loop-rewind-stack (param i32 i64) (result i32 i64)
    (loop (param i32 i64) (result i32 i64)
      (br_if 0 (i32.const 1))
      (nop)
    )
  ))
  "type mismatch"
)