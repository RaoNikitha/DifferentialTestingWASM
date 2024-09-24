;; - **Test 9**: Create two modules where one imports a function that calls another function via `call_indirect`. Use a third module to import the first module's function and call it. Check the proper handling of nested `call_indirect` instructions across multiple module boundaries to ensure robust stack operation and control flow.

 ;; (module
  (import "mod1" "func1" (func $importedFunc))
  (func $mainFunc
    (call $importedFunc))
)
(module
  (type $sig (func (param i32) (result i32)))
  (func $calledFunc (param i32) (result i32)
    (i32.const 42))
  (table 1 funcref)
  (elem (i32.const 0) $calledFunc)
  (func $indirectCaller (param i32) (result i32)
    (call_indirect (type $sig) (local.get 0)))
  (export "func1" (func $indirectCaller))
)
(assert_invalid
  (module
    (import "mod2" "importedFunc" (func (param i32) (result i32)))
    (func (param i32) (result i32)
      (call $importedFunc (local.get 0)))
  )
  "type mismatch"
)