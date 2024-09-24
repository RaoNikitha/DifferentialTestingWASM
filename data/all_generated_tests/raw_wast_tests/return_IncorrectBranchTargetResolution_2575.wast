;; Function with a loop containing a nested block, followed by a `return` within the loop, to ensure the return skips all loop iterations and intermediate blocks, jumping correctly to the function's end.

(assert_invalid
  (module
    (func $test
      (result i32)
      (local i32)
      (loop $l
        (block $b 
          (return (i32.const 42))
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
        )
        (br $l)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)