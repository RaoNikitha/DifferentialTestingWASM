;; 10. Create a loop within which a conditionally executed block changes a variable that determines the outcome of the `br_if` condition. Ensure the condition is evaluated correctly each time. This tests how conditionally modified variables within the loop affect the condition evaluation.

(assert_invalid
  (module
    (func (local $i i32)
      (loop (result i32)
        local.get $i
        i32.const 1
        i32.eq
        br_if 1
        i32.const 1
        local.set $i
        br 0
      )
      drop
    )
  )
  "type mismatch"
)