;; Create a WebAssembly module with an exported function that calls an indirectly referenced imported function which manipulates the operand stack and calls another indirect function. Verify the operand stack state and control flow across module boundaries in both implementations to detect potential stack corruption or flow issues.

(assert_invalid 
  (module 
    (import "env" "imported_func" (func $imported_func (param i32) (result i32))) 
    (type $sig1 (func (param i32) (result i32))) 
    (type $sig2 (func (result i32))) 
    (table funcref (elem $imported_func)) 
    (func $indirect_caller (call_indirect (type $sig1) (i32.const 0))) 
    (func $test_func (call_indirect (type $sig2) (i32.const 0))) 
  ) 
  "type mismatch"
)