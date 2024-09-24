;; 9. Simulate an indirect call to an imported function that purposefully triggers a trap within the callee, verifying that control flow exits correctly without affecting the calling module's execution state or stack integrity.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (import "env" "trapper" (func $trapper (param i32) (result i32)))
    (table funcref (elem $trapper))
    (func $test 
      (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)