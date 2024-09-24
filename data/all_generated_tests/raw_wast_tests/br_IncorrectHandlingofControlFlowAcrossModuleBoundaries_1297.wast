;; 8. **Test Description 8:** Establish a `block` within an exported function and call an imported function that contains a `loop`. Utilize `br` from the import to jump out of the loop and back to the caller’s context ensuring the correct handling of control flow and stack state.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_func (export "test_func") (result i32)
      (block (result i32)
        (call $external_func)
        (loop
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)