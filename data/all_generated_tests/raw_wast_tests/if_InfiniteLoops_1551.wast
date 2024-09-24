;; 2. Design a test where a `br_if` command inside an `if-else` structure should exit a nested `loop`, but due to implementation errors, the stack gets mismanaged, causing an infinite loop:    ```    (loop $outer      (if (i32.const 1)        (then (loop $inner (br_if $outer (i32.const 1))))        (else (br $outer))      )    )    ```    This ensures the correct flow control in nested loops with branching based on conditions evaluated inside `if` statements.

(assert_invalid
  (module 
    (func (loop $outer
      (if (i32.const 1)
        (then (loop $inner (br_if $outer (i32.const 1))))
        (else (br $outer))
      )
    ))
  )
  "invalid branch target"
)