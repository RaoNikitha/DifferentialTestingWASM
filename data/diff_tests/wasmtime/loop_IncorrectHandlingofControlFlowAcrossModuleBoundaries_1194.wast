;; Test 5: A loop within an imported function that is called within another module, with nested branches targeting the loop label. The test ensures that control flow and stack unwinding maintain consistency across the module boundary.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (call $external_func)
      (loop (block (br 1) (br 0)))
    )
  )
  "type mismatch"
)