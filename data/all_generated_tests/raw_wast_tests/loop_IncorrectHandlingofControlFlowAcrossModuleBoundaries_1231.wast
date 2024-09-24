;; 2. **Test Case 2**: Create a loop that calls an exported function from another module, which itself contains a loop that calls back into the original module. This test checks the proper transition of call stacks and loop entry/exits across module boundaries, ensuring that each implementation correctly handles the nested calls and returns.

(assert_invalid 
  (module 
    (func $invoke_exported 
      (call $external_loop))
    (func (export "external_func") 
      (call $invoke_exported))
    (import "external" "external_loop" (func $external_loop))
  ) 
  "type mismatch"
)