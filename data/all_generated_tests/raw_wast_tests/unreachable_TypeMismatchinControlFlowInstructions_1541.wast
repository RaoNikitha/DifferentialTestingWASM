;; 2. Create a loop where the `unreachable` is placed inside the loop, followed by a type-consuming instruction like `i32.div_s`. Verify if the loop enforces correct type constraints before exiting on reaching the `unreachable`.

(assert_invalid
  (module (func $loop-with-unreachable-and-type-consuming-instruction
    (loop
      (unreachable)
      (i32.div_s (i32.const 1) (i32.const 2))
    )
  ))
  "type mismatch"
)