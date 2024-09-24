;; 7. Setup a test case that contrasts `br` instructions within nested blocks by including a function with a sequence of conditional checks followed by a `return`. This checks conformity when branches and returns are intermixed within nested block contexts.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner
          (br_if $inner (i32.const 1))
          (return)
        )
        (br $outer)
      )
    )
  )
  "type mismatch or unexpected behavior"
)