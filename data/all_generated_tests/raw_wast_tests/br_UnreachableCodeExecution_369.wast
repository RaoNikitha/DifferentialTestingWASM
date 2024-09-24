;; 10. **Test Description:** Use a combination of `block`, `loop`, and `if` constructs with `br` instructions targeting non-nested and non-contiguous labels. Place `unreachable` after each wrong branch.     - **Constraint Checked:** Enforced structured control to prohibit unstructured jumps.     - **Relation to Unreachable Code Execution:** Tests for enforcement of well-nested control structures to prevent reaching `unreachable`.

(assert_invalid
  (module
    (func $test_block_loop_if
      (block
        (loop
          (if (i32.const 1)
            (then (br 3))
          )
          (unreachable)
        )
      )
    )
  )
  "unknown label"
)