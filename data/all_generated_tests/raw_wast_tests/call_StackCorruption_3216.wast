;; 5. Design a `call` to a recursive function that incorrectly processes the stack frame, ensuring the stack depth before and after the call is correct and does not overflow.

(assert_invalid
  (module
    (func $recursive-call
      (local $i i32)
      (local.set $i (i32.const 5))
      (block $exit
        (loop $loop
          (br_if $exit (i32.eqz (local.get $i)))
          (call $recursive-call)
          (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        )
      )
    )
  )
  "stack overflow"
)