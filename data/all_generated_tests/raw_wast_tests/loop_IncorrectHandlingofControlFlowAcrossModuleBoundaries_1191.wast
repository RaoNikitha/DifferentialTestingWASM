;; Test 2: A module that exports a function containing a loop, which is then called by another module. Verify that the return from the loop to the calling function is correctly managed without stack corruption. This can highlight differences in how WebAssembly and Wizard Engine manage control flow during function calls across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (result i32)
      (i32.const 0)
      (loop (result i32)
        (call $external_func)
        (br_if 0 (i32.const 0))
        (i32.const 1))
      (i32.add))
    (export "test" (func $test))
  )
  "type mismatch"
)