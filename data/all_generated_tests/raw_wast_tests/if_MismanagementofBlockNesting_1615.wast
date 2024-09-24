;; 6. **Test for `loop` within `if-else` in Nested Structures**: Integrate a `loop` within nested `if-else` blocks to check if the looping structure correctly maintains its execution without prematurely terminating or misnavigating control flow.

(assert_invalid
  (module 
    (func $nested-loop-if (result i32)
      (if (result i32)
        (i32.const 1)
        (then 
          (loop (result i32) 
            (br 0)
          )
        )
        (else 
          (i32.const 1)
          (loop 
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)