;; Test a `loop` where `br_if` branches based on a comparison operation inside the loop (e.g., `i32.eq`). Push `10` onto the stack, compare to `20`, and ensure no branch occurs.

(assert_invalid
  (module (func $br_if_loop 
    (loop (result i32)
      (i32.const 10)
      (i32.const 20)
      (i32.eq)
      (br_if 0)
    )
  ))
  "type mismatch"
)