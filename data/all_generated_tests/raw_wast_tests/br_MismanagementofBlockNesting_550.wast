;; 1. Test a deeply nested block structure of three `block` instructions, using a `br` to target the second deepest block. Check whether the implementation correctly pops the stack values before resuming execution after the targeted block. Constraints checked: correct label referencing and operand stack management.

(assert_invalid
  (module
    (func $test-deeply-nested-blocks
      (block
        (block
          (block
            (br 1)
          )
        )
      )
    )
  )
  "unknown label"
)