;; 9. **Block-scoped Br and Call to Imported Function:**    Build a test where a block-scoped `br` is followed by a call to an imported function. This checks if the control flow correctly resumes after the `br` and handles the imported function transition seamlessly.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $test
      (block $blk1 (result i32)
        (i32.const 42)
        (br 0)
        (call $externalFunc)
      )
    )
  )
  "type mismatch"
)