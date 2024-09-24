;; 4. Write a `loop` where the stack contains mixed types before entering the loop. The loop's internal instructions assume only one type, leading to type errors during execution due to incorrect stack unwinding and manipulation.

(assert_invalid
  (module
    (func $mixed_stack
      (i32.const 1) (f32.const 2.0)
      (loop (result i32)
        (i32.add) (br 0)
      )
    )
  )
  "type mismatch"
)