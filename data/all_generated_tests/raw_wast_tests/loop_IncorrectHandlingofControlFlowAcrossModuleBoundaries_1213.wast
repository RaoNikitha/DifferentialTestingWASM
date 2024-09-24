;; 4. A test that has a `loop` executing a series of `br` and `call_import` instructions with varying depths of imports and exports, to detect if branch labels are correctly indexed and validated across module boundaries.

(assert_invalid
  (module
    (import "env" "func" (func $importedFunc (param i32)))
    (func $testLoop
      (i32.const 0)
      (loop (result i32)
        (br 0)
        (call $importedFunc (i32.const 1))
        (br 1)
      )
    )
  )
  "type mismatch"
)