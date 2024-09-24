;; Test 8: Construct a scenario involving an `if` inside a `block`, which contains a `loop` with nested `if` branches and `br` instructions. Verify that each branch maintains proper scope and stack alignment under nested conditions without misinterpreting label depths.

(assert_invalid
  (module
    (func $nested-if-block-loop
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (i32.const 1)
            (then (br 0 (i32.const 0)))
            (else (if (result i32)
                      (i32.const 1)
                      (then (br 1 (i32.const 0)))
                      (else (br 2 (i32.const 0))))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)