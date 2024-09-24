;; 10. Design a scenario where a main function calls a helper function within a `br_if` branch. The helper function modifies the stack based on its own logic. Incorrect condition evaluation in the `br_if` should cause an incorrect stack state that affects the main function's logic.

(assert_invalid
  (module
    (func $helper
      (i32.const 42) 
      (br_if 0 (i32.const 0))
    )
    (func $main
      (call $helper)
      (i32.add (i32.const 1) (i32.const 1))
    )
  )
  "type mismatch"
)