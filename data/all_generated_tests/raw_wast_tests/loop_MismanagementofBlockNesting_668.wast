;; - Test 9: Construct a loop consisting of mixing other control structures like an `if` that encompasses another nested loop with branches designed to test each possible target depth. This test evaluates the complex interaction of the control flow in nested and loop structures.

(assert_invalid
  (module
    (func $nested-loop-test (result i32)
      (block $outer
        (i32.const 1)
        (loop $inner
          (if (result i32)
            (then
              (i32.const 2)
              (br 1) ;; break to outer block
            )
            (else
              (block (result i32)
                (i32.const 3)
                (loop (result i32)
                  (br_if 1 (i32.const 0))
                )
              )
              (br 0) ;; continue inner loop
            )
          )
          (br 2) ;; invalid: target out of bounds
        )
      )
    )
  )
  "type mismatch or label out of bounds"
)