;; 3. **Call Imported Function with Excessive Arguments**:    Call an imported function with more arguments than required. The wizard_engine should detect and reject the extra arguments on the stack due to its `popE` enforcement, while the WebAssembly implementation might not handle it correctly if argument counts aren’t strictly enforced.

(assert_invalid
  (module
    (import "env" "external_func" (func $imported_func (param i32)))
    (func (call $imported_func (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)