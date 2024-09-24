;; 7. **Test Description**: Have module A import a function from module B that performs a series of stack-based operations, preceded and followed by `nop` instructions in module A before calling and after returning from the import. Ensure the integrity of the stack through this procedure.

(assert_invalid
  (module
    (import "B" "imported_func" (func $imported_func (result i32)))
    (func $test (result i32)
      (nop)
      call $imported_func
      (nop)
    )
  )
  "type mismatch"
)