;; 7. Combine an `unreachable` with a sequence of blocks containing `br` and `br_if` instructions where each block targets the next. Check if `unreachable` causes the correct block resolution to be skipped and the trap to occur.

(assert_invalid
  (module (func $test-unreachable-blocks-br-br_if
    (block $outer
      (br_if $outer (i32.const 1))
      (block $inner
        (br_if $inner (i32.const 0))
        (unreachable)
      )
    )
  ))
  "type mismatch"
)