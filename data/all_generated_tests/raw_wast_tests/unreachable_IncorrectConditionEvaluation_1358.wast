;; 9. Design a series of nested loops with `br_if` conditions checking stack values, where the inner loop contains an `unreachable`. Verify if incorrect branching causes the `unreachable` trap to execute, indicating condition evaluation bugs.

(assert_invalid
  (module
    (func $complex-nested-loop (result i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (block (result i32)
          (i32.const 2)
          (br_if 0 (i32.const 0))
          unreachable
        )
      )
    )
  )
  "type mismatch"
)