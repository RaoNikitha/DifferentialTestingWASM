;; 8. **Loop with Conditional Branching:**    - Test a `loop` containing an `if` statement that houses `br` instructions targeting the loop's beginning.    - Ensures correct implementation of conditional backward branching and consistent handling of conditional paths within loops.

(assert_invalid
  (module
    (func $loop_conditional_branching
      (loop $L1
        (block
          (i32.const 1)
          (br_if 0 (i32.const 1))
        )
        (if
          (i32.const 0)
          (then
            (block
              (br 1)
            )
          )
        )
      )
    )
  )
  "unknown label"
)