;; Construct a nested loop where the inner loop uses br_if to break out conditionally based on a calculation from the operand stack, ensuring proper stack unwinding and continuation of the outer loop.

(assert_invalid
  (module 
    (func $nested-loop 
      (loop 
        (loop 
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)