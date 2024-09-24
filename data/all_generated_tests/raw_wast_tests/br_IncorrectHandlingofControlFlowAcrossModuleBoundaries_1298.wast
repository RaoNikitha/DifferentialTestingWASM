;; 9. **Test Description 9:** Test handling an imported function that internally uses `br` instructions to manage its own control flow. Ensure this correctly resumes with the caller function’s subsequent `br` instructions crossing module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func (result i32)))
    (func $test (block (result i32)
      (call 0)  ;; call the imported function which uses `br`
      (br 0)    ;; branch to the end of the block
      (i32.const 1)
    ))
  )
  "type mismatch"
)