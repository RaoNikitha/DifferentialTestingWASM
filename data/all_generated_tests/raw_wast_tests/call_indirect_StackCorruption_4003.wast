;; - Test 2: Create a table of functions where one function has fewer parameters than expected. Use `call_indirect` to call this function with more parameters than it accepts, causing stack underflows. Check if the stack underflow is properly trapped and reported.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32))
    (func $call-with-extra-param
      (call_indirect (type 0) (i32.const 0) (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)