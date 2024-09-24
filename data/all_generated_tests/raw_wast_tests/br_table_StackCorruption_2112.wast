;; Test 2: Construct nested `block` and `loop` structures with a `br_table` intending to branch to both inner and outer blocks and loops. Verify stack integrity at each depth level transition to detect potential stack corruption from improper stack management.

(assert_invalid
  (module (func $nested-block-loop
    (block $label0
      (loop $label1
        (block $label2
          (br_table 0 1 2 (i32.const 3))
        )
        (br_table 0 1 2 (i32.const 0))
      )
      (i32.const 1)
    )
  ))
  "unknown label"
)