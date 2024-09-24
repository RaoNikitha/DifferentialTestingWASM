;; - Create a deep nesting of conditionals with complex dependencies ensuring that inner `br_if` conditions should never lead to an `unreachable` within the inner blocks. Test if any incorrect condition evaluation causes a trap.

(assert_invalid
  (module 
    (func 
      (block 
        (if (i32.const 1) 
          (then
            (if (i32.const 1) 
              (then 
                (if (i32.const 0) 
                  (then (unreachable))
                  (else (i32.const 1))
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)