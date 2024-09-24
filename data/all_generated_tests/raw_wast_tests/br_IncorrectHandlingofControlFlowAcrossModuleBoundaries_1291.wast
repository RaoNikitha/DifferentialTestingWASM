;; 2. **Test Description 2:** Define a loop within the module that calls an imported function. Use `br` to jump out of the loop and back into the module code, verifying that the stack state is maintained correctly after crossing the module boundary.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (loop (result i32)
        (br_if 0 (call $external_func))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)