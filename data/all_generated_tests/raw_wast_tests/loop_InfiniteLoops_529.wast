;; - Test 10: Develop a loop with `br_if` in which `Wizard Engine` incorrectly interprets a branch function type, causing continuous looping instead of `WebAssembly`'s accurate conditional control flow exit.

(assert_invalid
  (module
    (func
      (i32.const 1)
      (loop (result i32)
        (br_if 0 (i32.const 0))
        (i32.add)
      )
    )
  )
  "type mismatch"
)