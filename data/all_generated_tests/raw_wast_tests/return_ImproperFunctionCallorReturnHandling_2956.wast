;; 5. Test correct handling of return values in recursive functions:    - Create a recursive function that returns computed values through multiple recursion levels.    - Ensure the return values propagate correctly up the call stack, maintaining type and stack integrity.

(assert_invalid
  (module
    (func $type-recursive-return (param i32) (result i32)
      (if (result i32)
        (i32.eqz (local.get 0))
        (then (i32.const 0) (return (i32.const 0)))
        (else (call $type-recursive-return
          (i32.add (local.get 0) (i32.const -1))) (return))
      )
    )
  )
  "type mismatch"
)