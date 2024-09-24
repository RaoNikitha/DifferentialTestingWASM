;; 4. Implement a function that includes nested `if`-statements with `unreachable` inside the inner `if`. Call this function indirectly and check if it traps correctly or continues to execute misleadingly.

(assert_invalid
  (module 
    (func (result i32)
      (if (i32.const 1)
        (then
          (if (i32.const 1)
            (then (unreachable))
            (else (i32.const 0))
          )
          (i32.const 1)
        )
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)