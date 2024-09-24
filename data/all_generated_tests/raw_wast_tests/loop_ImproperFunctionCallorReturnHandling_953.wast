;; 4. **Test Description**: Construct a loop invoking a `call` function that contains another loop. Verify that outer loop and inner loop execution sequences align correctly without unexpected exit or return.    **Constraint Checked**: Recursive loop handling with function calls and proper return propagation.

(assert_invalid
  (module
    (func $inner_loop
      (loop
        br 0
      )
    )
    (func $outer_loop
      (i32.const 0)
      (loop
        call $inner_loop
        br_if 0
      )
    )
  )
  "function call and loop interaction invalid"
)