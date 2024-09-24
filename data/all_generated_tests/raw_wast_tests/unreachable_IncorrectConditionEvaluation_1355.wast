;; 6. Construct a sequence where an `i32_const` value and `i32.ne` condition are used with a `br_if`, directing to a block containing `unreachable`. The test examines condition evaluation by checking if the trap is activated erroneously.

(assert_invalid
  (module
    (func
      (block
        (i32.const 1)
        (i32.const 0)
        (i32.ne)
        (br_if 0)
        (unreachable)
      )
    )
  )
  "type mismatch"
)