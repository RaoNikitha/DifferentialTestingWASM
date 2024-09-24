;; 6. **Loop with Improper Label Break**: Design a test where a `loop` label is referenced within an `if` condition incorrectly. Verify that a correct branch out of the loop is taken to avoid an infinite loop.

(assert_invalid
  (module
    (func $loop-improper-label-break
      (block $outer
        (loop $inner
          (i32.const 1)
          if
            br 2
          end
        )
      )
    )
  )
  "invalid label reference"
)