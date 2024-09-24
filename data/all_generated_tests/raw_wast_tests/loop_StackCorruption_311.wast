;; - Test 2: Define a nested loop structure where the inner loop branches back to itself several times before allowing the outer loop to complete a single iteration. Validate whether stack height and values are consistent across multiple nested iterations.

(assert_invalid
  (module
    (func $nested-loop
      (i32.const 0)
      (i32.const 5)
      (block $outer
        (loop $inner
          (br_if $inner (i32.const 1))
          (br $outer)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)