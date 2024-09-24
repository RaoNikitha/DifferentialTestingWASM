;; - Test Case 7: Design a loop that reuses the same label across differently scoped `loop` blocks with a `br_if` and ensure the failed branches lead to an `unreachable` outside. This tests for label scope resolution errors.

(assert_invalid
  (module
    (func $loop-label-reuse
      (block $first
        (loop $inner (block $second
          (br_if $first (i32.const 1))
          (br_if $second (i32.const 0))
          (loop $first (unreachable))
        ))
      )
    )
  )
  "type mismatch"
)