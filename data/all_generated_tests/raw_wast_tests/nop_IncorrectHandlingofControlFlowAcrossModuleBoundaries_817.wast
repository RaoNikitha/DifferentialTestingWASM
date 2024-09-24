;; 8. **Test Description**: Implement a test where Module A has a function that ends with multiple `nop` instructions followed by a `return` statement. Check that when this function is imported and called from Module B, the `nop` instructions do not interfere with the control flow and the correct value is returned to Module B.

 ;; (module
  (func $a (result i32)
    nop
    nop
    return
  )
  (export "a" (func $a))
)

(module
  (import "A" "a" (func $a (result i32)))
  (func (export "b") (result i32)
    call $a
  )
)

(assert_return
  (invoke "b") (i32.const 0)
)