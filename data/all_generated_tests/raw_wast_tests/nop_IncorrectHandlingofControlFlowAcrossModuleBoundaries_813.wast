;; 4. **Test Description**: Develop a scenario where a function in Module A performs a combination of computations and `nop` instructions before calling an imported function from Module B. Ensure that control flow transitions correctly to Module B without interference from `nop` instructions in Module A.

(assert_invalid
  (module
    (import "module_b" "imported_func" (func $imported_func (result i32)))
    (func $test_fn (result i32)
      (i32.const 1)
      (nop)
      (i32.add)
      (nop)
      (call $imported_func)
    )
  )
  "type mismatch"
)