;; A `block` containing `if` and `else` conditions with different stack manipulations in each branch to verify the final stack state matches the block’s result type regardless of the branch taken.

(assert_invalid
  (module (func $test-block-if-else (result i32)
    (block (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 2)
          (i32.add)
        )
        (else
          (i32.const 1)
          (br 0)
        )
      )
    )
  ))
  "type mismatch"
)