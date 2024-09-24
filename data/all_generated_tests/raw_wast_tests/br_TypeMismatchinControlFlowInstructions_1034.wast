;; Test 5: Construct a loop that expects two integer inputs but use a br instruction to target this loop with a single integer, causing a type mismatch.

(assert_invalid
  (module
    (func $type-mismatch-in-loop
      (loop (param i32 i32)
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)