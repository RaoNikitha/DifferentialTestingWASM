;; 9. **Test Description**: Create a test where a function in module A executes a `nop` instruction before calling an exported recursive function in module B. Validate that the recursion and control flow are correctly handled without disruptions from the `nop`.

 ;; (module
  (import "B" "rec_func" (func $rec_func))
  (func (export "test_nop_recursion")
    nop
    call $rec_func
  )
)

(module
  (func $rec_func
    (call $rec_func)
  )
  (export "rec_func" (func $rec_func))
)