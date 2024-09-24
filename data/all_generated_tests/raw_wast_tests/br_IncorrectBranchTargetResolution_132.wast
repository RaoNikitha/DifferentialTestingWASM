;; 3. **Deeply Nested Loops with Varying Labels:**    Write a function with several nested `loop` constructs and use multiple `br` instructions to different loop levels. Check if each branch correctly targets the intended loop label to either continue or exit the appropriate loop.

(assert_invalid
  (module
    (func $deep-nest-loop
      (loop $outer
        (i32.const 0)
        (loop $middle
          (i32.const 1)
          (loop $inner
            (i32.const 2)
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)