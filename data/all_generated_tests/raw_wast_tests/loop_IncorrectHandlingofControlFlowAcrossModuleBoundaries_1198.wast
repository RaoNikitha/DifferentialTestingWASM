;; Test 9: An exported function containing a loop with backward jumps (`br`). The function is used in multiple modules to verify if the loops’ backward jumps are correctly interpreted by both implementations when branching across module boundaries.

(assert_invalid
  (module
    (func $test
      (loop (result i32)
        (br 0)
        (i32.const 0)
      )
    )
    (export "test" (func $test))
  )
  "type mismatch"
)