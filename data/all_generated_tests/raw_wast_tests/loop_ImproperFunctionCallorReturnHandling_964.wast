;; Create a loop with calls to functions that themselves include loops. Have the loop condition depend on the outer loop's state and function return value. This tests proper context switching and return value management between nested loops and function calls.

(assert_invalid
  (module
    (func $inner
      (loop $inner_loop (result i32)
        (i32.const 1)
        (br_if $inner_loop (i32.const 0))
      )
    )
    (func $outer
      (loop $outer_loop (result i32)
        (call $inner)
        (br_if $outer_loop (i32.eqz (i32.const 0)))
      )
    )
  )
  "type mismatch"
)