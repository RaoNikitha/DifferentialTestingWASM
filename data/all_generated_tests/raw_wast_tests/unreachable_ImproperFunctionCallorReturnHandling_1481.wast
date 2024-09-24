;; 2. Implement a function with multiple `call` instructions, one of which leads to a function that executes `unreachable`. Ensure the sequence traps correctly at the point of the `unreachable` execution.

(assert_invalid
  (module
    (func $f1
      (block
        (call $f2)
        (call $f3)
      )
    )
    (func $f2
      (unreachable)
    )
    (func $f3
      (nop)
    )
  )
  "type mismatch"
)