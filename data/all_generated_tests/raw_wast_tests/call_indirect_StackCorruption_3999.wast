;; 8. **Cross-Module Function Call**:    - Create a `call_indirect` that attempts to call a function from another module with a different or incompatible function signature. Ensure the process of pushing arguments and popping results from the stack does not lead to corruption due to type errors.

(assert_invalid
 (module
  (type (func (param i32) (result i32)))
  (type (func (param i32 i32) (result i32)))
  (import "env" "funcExt" (func $ext (type 1)))
  (table 1 funcref)
  (elem (i32.const 0) $ext)
  (func $extern-call-indirect
   (call_indirect (type 0) (i32.const 1) (i32.const 0))
  )
 )
 "type mismatch"
)