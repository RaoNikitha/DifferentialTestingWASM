;; 5. Test multiple `if` statements nested within `block` structures where `br` targets an outermost `if`:    - **Constraint Checked**: Proper resolution of the most deeply nested `if` label.    - **Incorrect Branch Target**: Wrong branch resolution might result in skipping essential `if` branches.

(assert_invalid
  (module
    (func $nested_if_block
      (block
        (block
          (if (i32.const 1)
            (then (block (if (then (br 2))))))
        )
      )
    )
  )
  "unknown label"
)