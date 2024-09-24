;; Design a nested loop with an `if` statement within the inner loop. Use a `br_if` to exit the inner loop conditionally. Ensure WebAssembly correctly remains in the outer loop while Wizard Engine incorrectly exits both loops due to misinterpretation of context.

(assert_invalid
  (module
    (func $nested_loop_with_if (param $p i32) (result i32)
      (local $i i32)
      (local $j i32)
      (local.set $i (i32.const 5))
      (loop $outer
        (loop $inner
          (local.set $j (i32.const 3))
          (if (local.get $p)
            (then
              (br 1)  
            )
          )
          (local.set $j (i32.sub (local.get $j) (i32.const 1)))
          (br_if 0 (i32.ne (local.get $j) (i32.const 0)))
        )
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (br_if $outer (i32.ne (local.get $i) (i32.const 0)))
      )
      (local.get $i)
    )
  )
  "type mismatch or context misinterpretation"
)