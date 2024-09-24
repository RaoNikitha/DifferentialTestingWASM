;; 6. **Early Exit with Nop Within Loop and Branches**: Test a loop that contains `nops` followed by `br` and `br_if` instructions to exit the loop prematurely. This validates whether the branch can correctly exit the loop despite the `nop` instructions occurring within the loop body.

(assert_invalid
  (module
    (func $early-exit-via-branch
      (loop
        (nop)
        (br_if 0 (i32.const 0))
        (nop)
        (br 1)
        (nop)
      )
    )
  )
  "label index out of bounds"
)