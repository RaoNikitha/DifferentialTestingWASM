;; Test 4: Embed `nop` in a loop that heavily pushes and pops values on the stack to observe any possible stack underflows or overflows caused by incorrect handling of `nop`.

(assert_invalid
  (module
    (func $loop-nop
      (loop
        (i32.const 42)
        (nop)
        (drop)
        (br 0)
      )
    )
  )
  "type mismatch"
)