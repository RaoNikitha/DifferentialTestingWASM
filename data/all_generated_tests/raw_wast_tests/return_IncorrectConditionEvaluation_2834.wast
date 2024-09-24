;; 3. Write a nested function call where the inner function uses `return` right after a `br_if` based on a comparison. Test if one implementation returns from the outer function instead of just the inner one.

(assert_invalid
  (module
    (func $outer (param i32) (result i32)
      (call $inner (local.get 0))
    )
    (func $inner (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.eq)
      (br_if 0)
      (return)
      (i32.const 42)
    )
  )
  "type mismatch"
)