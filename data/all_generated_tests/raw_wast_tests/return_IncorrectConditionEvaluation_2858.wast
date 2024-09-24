;; 7. Write a loop with a `br_if` inside, where loop continues if condition is true and exits if false. Incorrect condition evaluation will misdirect loop control flow.

(assert_invalid
  (module
    (func $loop_with_br_if (param i32) (result i32)
      (loop (result i32)
        (br_if 0 (i32.eq (local.get 0) (i32.const 0)))
        (return)
      )
    )
  )
  "type mismatch"
)