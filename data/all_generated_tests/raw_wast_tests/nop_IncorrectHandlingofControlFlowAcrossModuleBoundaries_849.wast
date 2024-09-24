;; 10. **Test Description**: Design a function in module A containing `nop` instructions before and after calling a chain of functions across multiple modules (e.g., module B calls module C). Verify that the chain of calls and the control flow across multiple boundaries maintain the stack and execution state accurately.

(assert_invalid
  (module
    (func $call-b (nop) (call $module-b) (nop))
    (table $table 1 funcref)
    (elem (i32.const 0) $call-b)
    (export "call-b" (func $call-b))
  )
  "type mismatch"
)