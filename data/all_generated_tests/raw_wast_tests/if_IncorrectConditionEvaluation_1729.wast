;; - Include an `if` condition within a loop to evaluate if the condition is correctly re-evaluated with each iteration and correctly determines the control flow for the loop execution.

(assert_invalid
  (module
    (func $loop-if-check (result i32)
      (loop $top
        (if (result i32) (i32.const 0)
          (then (br $top))
          (else (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)