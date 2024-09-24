;; 5. Construct a `loop` that includes a `call` to a function that recursively calls itself. The function should modify stack values within each call to verify handling of nested calls and stack integrity.

(assert_invalid
  (module
    (func $recursive (result i32)
      (call $recursive)
      (i32.add (i32.const 1))
    )
    (func $test (result i32)
      (i32.const 0)
      (loop (result i32)
        (call $recursive)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "stack overflow"
)