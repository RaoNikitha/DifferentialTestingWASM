;; Test 5: Construct a loop with `nop` followed by conditional loop exit (`br_if`). Test if the condition evaluation is unaffected by `nop` and exits the loop properly.

(assert_malformed
  (module
    (func
      loop (nop) (i32.const 1) (br_if 0)
      end)
    )
)