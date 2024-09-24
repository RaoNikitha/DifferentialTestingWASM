;; Validate br_if on a loop where operand stack handling involves mixed data types, ensuring that the loop exits conditionally based on proper type checking and stack unwinding.

(assert_invalid
  (module
    (func $loop-mixed-type-stack-unwind
      (loop (result i32)
        (i32.const 1)
        (i64.const 2)
        (br_if 0 (i32.const 1))
      )
      (drop)
    )
  )
  "type mismatch"
)