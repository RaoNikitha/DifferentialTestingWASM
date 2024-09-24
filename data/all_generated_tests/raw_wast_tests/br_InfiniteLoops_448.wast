;; 9. Write a test with a loop containing multiple branches using `br` to various blocks inside the loop. Incorrect management or restoration of the operand stack post-branch would prevent the loop exit and cause an infinite loop.

(assert_invalid
  (module
    (func $infinite_loop_due_to_invalid_br
      (loop (result i32)
        (block (br 1))
        (block (result i32) (br 0 (i32.const 1)))
        (br 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)