;; Test 8: A `block` that starts with a conditional branch (`br_if`) and takes different stack-based paths (depending on the condition) before executing `end`. Validate stack rebalancing and type compliance on reaching `end`.

(assert_invalid
  (module (func $test_conditional_branch (result i32)
    (block (result i32)
      (br_if 0 (i32.const 1) (i32.const 42))
      (i32.const 0)
    )
  ))
  "type mismatch"
)