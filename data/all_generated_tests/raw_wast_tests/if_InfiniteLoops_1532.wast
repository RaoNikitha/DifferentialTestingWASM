;; 3. A test with a `br_if` within an `if` block where `br_if` condition always evaluates to false but the `else` contains an infinite loop. This checks correct conditional branching out of the `else` to avoid infinite loops.

(assert_invalid
  (module
    (func $br_if_in_else_with_infinite_loop
      (if (result i32)
        (i32.const 1)
        (then (i32.const 1))
        (else (loop (br_if 0 (i32.const 0))))
      )
    )
  )
  "type mismatch"
)