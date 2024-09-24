;; 2. **Test Description**: Have module A export a function that starts with a `nop` instruction and then calls a function in module B, which returns a constant value. The exporting function should return this value. This test verifies if the `nop` instruction affects the call and return mechanics across modules.

 ;; (module
  (table 0 funcref)
  (memory 1)
  (export "test_func" (func $funcA))
  (import "moduleB" "get_const" (func $get_const (result i32)))
  (func $funcA (result i32)
    nop
    call $get_const
  )
)