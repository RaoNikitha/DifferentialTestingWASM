;; - Test 5: Use a `br_table` targeting nested control structures including nested `block`, `loop`, and `if`. This will test if the implementation correctly calculates label indices in a complex control flow scenario.

(assert_invalid
  (module
    (func $test
      (block 
        (block 
          (block 
            (loop 
              (block 
                (br_table 3 2 1 0 (i32.const 2))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)