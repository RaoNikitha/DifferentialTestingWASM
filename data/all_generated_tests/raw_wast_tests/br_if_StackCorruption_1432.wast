;; A sequence where an outer `block` contains an `if` statement, and inside the `if-then` block, a `br_if` targets the outer block. Test to ensure stack state consistency when the condition is true.

(assert_invalid
  (module
    (func $test
      (block $outer
        (i32.const 1)
        (if
          (then
            (br_if $outer (i32.const 1))
          )
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)