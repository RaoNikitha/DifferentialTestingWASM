;; 5. **Test Description**: Create a test where the module imports a function with a `loop` instruction that exports results, which are used in another exported function containing its own loop with a `br_if` instruction. This checks for continuity of execution and proper result passing across module boundaries during conditional branches.

(assert_invalid
 (module
  (import "env" "imported_func" (func $imported_func (result i32)))
  (func $test_loop
    (result i32)
    (local i32)
    (loop (result i32)
      (call $imported_func)
      (br_if 0 (i32.const 1))
    )
  )
  (export "test" (func $test_loop))
 )
 "type mismatch"
)