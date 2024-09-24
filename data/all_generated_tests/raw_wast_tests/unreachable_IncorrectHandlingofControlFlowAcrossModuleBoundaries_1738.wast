;; 9. **Test Description:**    Design a function that imports another function with an `unreachable` instruction inside a loop body. Check if executing this loop in the main module triggers a trap immediately and stops any further iteration in consistent manner across both implementations.

(assert_invalid
  (module
    (func $imported_func (result i32)
      (loop
        (unreachable)
      )
      (i32.const 0)
    )
    (export "test_func" (func $imported_func))
  )
  "type mismatch"
)