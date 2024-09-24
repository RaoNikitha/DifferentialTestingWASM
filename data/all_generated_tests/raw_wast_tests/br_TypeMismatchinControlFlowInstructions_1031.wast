;; Test 2: Create a nested structure with a loop that expects an integer input. Use br to target the loop but provide a string input instead.

(assert_invalid
  (module
    (func
      (block
        (loop (result i32)
          (br 0 (i32.const 42))
        )
      )
      (i32.const 0)
      (drop)
      (br 1 (i32.const 0) (i32.const 0) (i32.const 0))
      ;; Attempt to pass a string as input to a loop expecting integer.
      (br 0 (i32.const 42) [["some string"]])
    )
  )
  "type mismatch"
)