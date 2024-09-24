;; Test 9: Design a function that performs arithmetic operations before calling another function. Use `call` to pass the arithmetic result, and use `br_if` to branch based on evaluated boundary conditions (e.g., positive/negative results).

(assert_invalid
  (module
    (func $targetFunc (param i32))
    (func $testFunc (param i32) (result i32)
      (local i32)
      (local.set 0 (i32.add (local.get 0) (i32.const 1)))
      (br_if 0 (i32.gt_s (local.get 0) (i32.const 0)))
      (call $targetFunc (local.get 0))
    )
  )
  "type mismatch"
)