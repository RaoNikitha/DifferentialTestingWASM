;; - **Test 8**: Use a `br_table` within a loop with table entries leading to combinations of valid and impossible control structures (like not-yet-declared blocks). Provide an abnormal index and analyze how WebAssembly versus Wizard Engine handles these invalid target collisions.

(assert_invalid
  (module
    (func
      (loop (block $b (br_table 0 1 2 3 4 $b)) unreachable)
    )
  )
  "type mismatch or invalid label"
)