;; - Implement an `if-else` block where both `then` and `else` blocks contain loops, and check if the correct block is executed and loops are processed correctly based on the evaluated condition.

(assert_invalid
  (module
    (func $nested-loops-in-if-else
      (i32.const 1)
      (if (then
            (loop (br 0)) 
          ) 
          (else 
            (loop (br 0))
          )
      )
    )
  )
  "type mismatch"
)