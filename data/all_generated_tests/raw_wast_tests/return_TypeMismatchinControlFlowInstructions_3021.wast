;; Create a complex function with multiple nested `blocks` and `loops` where intermediate stack values are manipulated, leading to an inconsistent final stack state at `return`. This checks for deep type validation across nested control constructs.

(assert_invalid
  (module
    (func $complex-return-type-check (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (br 1)
          (drop)
          (block (result i32)
            (i32.const 2)
            (i32.add)
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)