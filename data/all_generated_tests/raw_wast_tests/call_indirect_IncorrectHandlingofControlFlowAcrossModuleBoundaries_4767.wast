;; 6. **Test for Multiple Module Export/Import Leading to Stack Underflow**:    Chain multiple modules that export and import functions. Perform indirect calls across these modules and check for stack underflow errors when the operand stack does not provide enough arguments for the called function across module boundaries.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (import "module1" "func" (func $imported_func (type 1)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (func (type 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)