;; 8. Implement a WebAssembly module containing a function with `br_table` to switch between local operations and a call to an imported function from another module. Validate transition consistency and operand type adherence across module boundaries during the execution of `br_table`.

(assert_invalid
 (module
  (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
  (func (param i32) (result i32)
   (block (result i32)
    (br_table 1 0 (i32.const 1) (call $imported_func (local.get 0)))
   )
  )
 )
 "type mismatch"
)