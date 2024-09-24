;; Test 6: Include a block with a conditionally nested `if` statement where `br_if` checks the result of a function call that returns either `0` or `1`. Test for correct branch-taking behaviour based on the return value.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (if (result i32)
          (block (br_if 0 (call $return_i32)))
          (i32.const 0)
          (br 1 (i32.const 1))
        )
      )
    )
    (func $return_i32 (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)