;; 5. Use a `br_if` with a more complex condition (e.g., comparison of two numbers), where one evaluates to true, to check if the engine branches correctly. Incorrect evaluation will not match expected path.

(assert_invalid
  (module
    (func $test (param i32 i32) (result i32)
      (if (i32.eq (local.get 0) (local.get 1))
        (return (i32.const 1))
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)