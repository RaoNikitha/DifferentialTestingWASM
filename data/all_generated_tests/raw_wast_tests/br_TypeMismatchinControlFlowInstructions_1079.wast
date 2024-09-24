;; 10. Nest a multi-case `switch` within a loop, where one case uses `br` to exit without matching the expected result type of the loop. This verifies if the implementation can manage complex, nested control flow instructions and catch type mismatches.

(assert_invalid
  (module
    (func $nested-loop-switch (result i32)
      (loop (param i32) (result i32)
        (block (result i32)
          (i32.const 1)
          (br_table 0 0 0 (i32.const 0))
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)