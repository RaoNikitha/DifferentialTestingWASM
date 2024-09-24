;; 6. Test a sequence of intermixed `block`, `loop`, and `if` constructs with branches targeting the most deeply nested `block`. Examine correct depth calculation and label referencing.

(assert_invalid
  (module
    (func 
      (block (result i32)
        (loop (result i32)
          (if (result i32) 
            (i32.const 1) 
            (block (result i32)
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)