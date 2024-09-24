;; 7. A scenario with an infinite loop intentionally created using `loop` and `br` without exit, but validated using an outer block return that should break the loop. Check correct block unwinding causes differential behaviors.

(assert_invalid
  (module
    (func $infinite-loop-return
      (loop
        (br 0)
      )
      (return)
    )
  )
  "unreachable code"
)