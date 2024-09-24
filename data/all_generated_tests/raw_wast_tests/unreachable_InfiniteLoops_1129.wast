;; 10. Implement a loop involving a counter that decrements each iteration and nested conditional blocks with an `unreachable` within one of the condition branches. By carefully choosing conditions, the loop should ideally trap and terminate when a specific count is met. Continuous looping beyond the count reveals incorrect handling of the trap.

(assert_invalid
  (module
    (func $loop_unreachable_conditional (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (local.get 0)
          (i32.const 1)
          (i32.le_s)
          (if (result i32)
            (then
              (local.get 0)
              (br 1)
            )
            (else
              unreachable
            )
          )
          (local.get 0)
          (i32.const 1)
          (i32.sub)
          (local.set 0)
          (br 0)
        )
      )
    )
  )
 "type mismatch"
)