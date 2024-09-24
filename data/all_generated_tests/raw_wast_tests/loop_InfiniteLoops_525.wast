;; - Test 6: Implement a nested loop in which the inner loop contains a `br_if` that `Wizard Engine` context mismanages, running infinitely compared to `WebAssembly`'s correct conditional exit.

(assert_invalid
  (module
    (func $nested_loop
      (loop $outer 
        (i32.const 1)
        (loop $inner (result i32)
          br_if $inner
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)