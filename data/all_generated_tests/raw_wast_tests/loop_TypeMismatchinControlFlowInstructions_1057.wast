;; 8. Structure a `loop` with a result type of `[f32]` and include instructions that ensure an `i32` is left on the stack after the loop. This checks compliance with expected loop result types in both engines.

(assert_invalid
  (module 
    (func $loop_result_mismatch
      (loop (result f32)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)