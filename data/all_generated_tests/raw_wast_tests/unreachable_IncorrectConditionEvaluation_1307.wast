;; 8. Use `unreachable` inside a loop body where the loop continuation condition includes a `br_if`. Ensure that reaching `unreachable` traps execution and `br_if` correctly evaluates whether to continue the loop or not.

(assert_invalid
  (module 
    (func $unreachable_in_loop_with_br_if 
      (loop
        (unreachable)
        (br_if 0 (i32.const 1))
      )
    )
  )
 "type mismatch"
)