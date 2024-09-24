;; A test using an `if` condition to call a function that has another nested `if` structure within it, calling different functions in the `then` and `else` branches and validating stack consistency, function return handling, and control flow correctness across deep nested blocks.

(assert_invalid
  (module
    (func $inner (result i32)
      (i32.const 0)
      (if (result i32) (i32.const 1) (then (i32.add (i32.const 1) (i32.const 2))) (else (i32.const 3)))
    )
    (func $outer (result i32)
      (i32.const 1)
      (if (result i32)
        (call $inner)
        (then (i32.add (i32.const 4) (i32.const 5)))
        (else (i32.sub (i32.const 6) (i32.const 7)))
      )
    )
  )
  "type mismatch"
)