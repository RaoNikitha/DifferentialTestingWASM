;; 2. **Test Return from Imported Function with `nop` Instruction**:    - **Constraint Checked**: Ensures `nop` does not interfere with the return value of an imported function.    - **Description**: Create a module that imports an integer-returning function. Place a `nop` before and after the `return` from this imported function. Test if both environments correctly maintain the return value without alteration when `nop` instructions are present.

 ;; (module
  (import "env" "imported_func" (func $imported_func (result i32)))
  (func (result i32)
    nop
    call $imported_func
    nop
  )
)