;; 9. Use a function that conditionally increments a counter before checking `br_if` and then `return`. Verify if counter increments are mishandled, causing one implementation to halt unexpectedly.

(assert_invalid
  (module
    (func $conditional-counter (result i32)
      (local i32)
      (i32.const 1)
      (local.set 0)
      (block (param i32)
        (i32.const 0)
        (br_if 0 (i32.eqz (local.get 0)))
        (return)
      )
      (i32.add (local.get 0) (i32.const 1))
    )
  )
  "type mismatch"
)