;; 3. **Test Description:**    A loop with a backward branch (`br`) that branches to another loop containing a function call with incorrect return types. This tests proper type consistency around nested loops and function calls.

(assert_invalid
  (module
    (func $f (result i64) (i64.const 1))
    (func $main
      (loop (result i32)
        (loop (result i64)
          (br 0 (call $f))
        )
      )
    )
  )
  "type mismatch"
)