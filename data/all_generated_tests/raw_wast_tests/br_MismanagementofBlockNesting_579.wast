;; Test 10: Construct a structure with an `if` inside a `block`, where the `if` contains another `block`. Use `br` to jump out of the innermost block directly to the end of the enclosing `if`. Ensure correct target block identification in nested conditions.

(assert_invalid
  (module
    (func $test
      (block
        (if
          (i32.const 1)
          (then
            (block
              (br 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)