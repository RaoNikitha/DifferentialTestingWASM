;; Implement a `loop` with multiple `br_if` instructions derived from independent stack evaluations. Push a `false` value to one condition to verify it doesn’t incorrectly trigger a branch.

(assert_invalid
  (module (func $loop-multiple-br_if 
    (i32.const 0) 
    (loop (result i32) 
      (br_if 0 (i32.const 1))
      (br_if 1 (i32.const 0))
    )
  ))
  "type mismatch"
)