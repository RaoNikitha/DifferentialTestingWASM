;; 10. **Test `nop` Interspersed with Function Calls**:    Insert `nop` between multiple function calls to check that function invocations and returns are handled accurately without control flow disruptions.

 ;; (module
  (func $foo (nop))
  (func $bar (nop))
  (func (nop) (call $foo) (nop) (call $bar) (nop))
)