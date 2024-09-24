;; 9. Construct a function with a loop that factors an input number by decrementing. Place a `br_if` to continue the loop until complete, and use a `return` when the remaining value meets a certain requirement. Check the correct execution flow on reaching return.

(assert_invalid
  (module
    (func $loop-with-return (param $x i32) (result i32)
      (local $factor i32)
      (local.set $factor (i32.const 0))
      (loop $loop
        (br_if $loop
          (i32.ne
            (local.tee $x
              (i32.sub (local.get $x) (i32.const 1))
            )
            (i32.const 0)
          )
        )
        (drop (local.get $factor))
      )
      (return (local.get $x))
    )
  )
  "type mismatch"
)