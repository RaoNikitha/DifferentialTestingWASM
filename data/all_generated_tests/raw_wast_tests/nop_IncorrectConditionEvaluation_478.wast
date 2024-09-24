;; 9. **Cross-function `nop` with `br_if`**:    Include `nop` in a function that is invoked by another function containing `br_if` instructions that rely on the invoked function's results. Test that the `nop` in the first function doesn't disrupt condition evaluation in the caller.

 ;; (module
  (func $called (nop) (i32.const 1))
  (func (result i32) (call $called) (br_if 0 (i32.const 0)))
)