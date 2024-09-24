;; 9. **Test 9**:    - An `if` block inside a `loop` that contains multiple `if-else` structures and `br` instructions targeting different depths.    - Checks robustness of control flow management and labeling across nested `loop` and `if-else` blocks.

(assert_invalid
  (module
    (func $nesting-loop-if (result i32)
      (loop $loop
        (i32.const 1)
        (if (result i32)
          (then
            (i32.const 2)
            (if (result i32)
              (then
                (i32.const 3)
                (br 2)
              )
              (else
                (i32.const 4)
              )
            )
            (drop)
            (br 1)
          )
          (else
            (i32.const 5)
          )
        )
      )
      (i32.const 6)
    )
  )
  "type mismatch"
)