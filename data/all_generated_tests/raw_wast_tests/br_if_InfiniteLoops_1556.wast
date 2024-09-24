;; Create a scenario where br_if targets a label associated with the outer loop from within an inner loop, checking for correct operand stack unwinding and loop exit behaviors.

(assert_invalid
  (module
    (func $nested-loop-br_if
      (loop (result i32)
        (loop
          (br_if 1 (i32.const 1))
          (br 0)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)