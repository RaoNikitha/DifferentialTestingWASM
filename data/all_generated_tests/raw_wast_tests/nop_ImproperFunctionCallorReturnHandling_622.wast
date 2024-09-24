;; 3. Construct a test where a `nop` is placed within a loop that calls a function repeatedly. The goal is to ensure that the `nop` does not disrupt the loop's execution or the function call/return sequence, validating accurate repetition and result accumulation.

(assert_invalid
  (module
    (func $loop-func (local $i i32)
      (loop $outer
        local.get $i
        i32.const 1
        i32.add
        local.set $i
        (nop)
        local.get $i
        i32.const 10
        i32.lt_s
        br_if $outer
      )
    )
    (func $main
      i32.const 0
      call $loop-func
    )
  )
  "type mismatch"
)