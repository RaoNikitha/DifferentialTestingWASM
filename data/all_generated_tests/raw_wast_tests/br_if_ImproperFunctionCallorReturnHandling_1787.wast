;; 8. **Test 8: Conditional Branch to Unreachable Code**: Implement a `br_if` attempting to branch to unreachable code in a function with multiple return points, validating if function pointers and label indices are delineated correctly by `wizard_engine`.

(assert_invalid
  (module
    (func $unreachable-branch
      (block
        (br_if 0x02 (i32.const 1))
        (unreachable)
      )
      (return)
      (i32.const 0)
    )
  )
  "unknown label"
)