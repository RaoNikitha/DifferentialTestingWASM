;; 1. Create a test where the `if` condition in the `then` branch leads to a loop that should logically exit based on a counter variable, but the evaluation of `br_if` does not break the loop properly due to improper context propagation. This tests label handling inaccurately nested.

(assert_invalid
  (module
    (func $invalid-nest-branch
      (local $counter i32)
      (i32.const 10)
      (set_local $counter)
      (block $exit
        (i32.const 1)
        (if (then
          (block $inner
            (loop $loop
              (get_local $counter)
              (i32.const 0)
              (i32.eq)
              (br_if $inner)
              (get_local $counter)
              (i32.const 1)
              (i32.sub)
              (set_local $counter)
              (br $loop)
            )
          )
          (br $exit)
        ))
      )
    )
  )
  "type mismatch"
)