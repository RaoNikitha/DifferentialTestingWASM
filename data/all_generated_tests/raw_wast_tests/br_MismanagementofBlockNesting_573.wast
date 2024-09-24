;; Test 4: Create a structure where a `loop` is inside another `loop`, and use `br` to target the outer loop from the inner loop's body. Verify that the branch correctly jumps to the start of the outer loop.

(assert_invalid
  (module
    (func $nested-loops-target-outer-loop
      (loop $outer
        (loop $inner
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)