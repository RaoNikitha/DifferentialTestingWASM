;; 2. **Test Description**: Write a call to a function containing a `br_if` instruction that is expected to exit a loop when a condition is false. If the condition always evaluates to true due to a bug, it will lead to an infinite loop, highlighting differential behavior.

(assert_invalid
  (module
    (func $infinite_loop
      (loop $l1
        (br_if $l1 (i32.const 1))
        (call $exit_loop)
      )
    )
    (func $exit_loop)
  )
  "infinite loop due to incorrect br_if condition"
)