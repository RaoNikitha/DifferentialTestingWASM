;; 10. **Block chain across multiple modules**:     - Design a sequence of blocks in one module, each calling an imported function from different modules.     - Verify that calling and returning between multiple modules maintains correct control flow and operand stack without any inconsistencies or crashes even under complex invocation sequences.

(assert_invalid
 (module
  (import "env" "external_func1" (func $external_func1 (result f32)))
  (import "env" "external_func2" (func $external_func2 (result f64)))
  (func $caller (result f32)
   (block (result f32)
    (call $external_func1)
    (block (result f64) (call $external_func2))
   )
  )
 )
"type mismatch"
)