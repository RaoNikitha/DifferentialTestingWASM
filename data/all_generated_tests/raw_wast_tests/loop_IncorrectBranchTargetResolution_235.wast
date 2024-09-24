;; 6. Design a test with nested `loop` instructions wherein each loop has multiple branches based on computed conditions. Compare branch target accuracy during iterative control flow.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (loop (result i32)
          (i32.const 1)
          (br_if 1 (i32.eqz (i32.const 0)))
          (br 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)