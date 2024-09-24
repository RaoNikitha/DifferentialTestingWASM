;; 9. Create a recursive function where the base case calls another function with `unreachable`. Verify if recursion correctly leads to a trap when the base case is reached.

(assert_invalid
  (module
    (func $base_case (result i32)
      unreachable
    )
    (func $recursive (param i32) (result i32)
      (local.get 0)
      (i32.const 0)
      (i32.eq)
      (if (result i32) (then (call $base_case)) (else (call $recursive (i32.sub (local.get 0) (i32.const 1)))))
    )
  )
  "type mismatch"
)