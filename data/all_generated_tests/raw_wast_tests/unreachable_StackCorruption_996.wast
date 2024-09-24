;; 7. Implement a sequence including `tee_local` instructions before and after `unreachable`. The test should verify proper stack cleanup before the unconditional trap and ensure no stack entries remain incorrectly.

(assert_invalid
  (module (func $test_tee_local_with_unreachable
    (block 
      (i32.const 42)
      (tee_local 0)
      (unreachable)
      (i32.add)
    )
  ))
  "stack type mismatch"
)