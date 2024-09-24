;; 10. Design a loop with a countdown counter and `br_if` to exit once the counter is zero. If there’s erroneous popping of operands, `br_if` could malfunction, causing the loop to continue indefinitely as the counter never correctly influences the exit condition.

(assert_invalid
  (module
    (func $countdown-loop
      (loop $loop
        (i32.const 10) ;; Initial counter value
        (i32.const 1)
        (i32.sub)
        (tee_local 0)
        (br_if $loop (i32.ne (get_local 0) (i32.const 0)))
      )
    )
  )
  "unbound label"
)