;; 7. Test a loop that repeatedly calls an exported function that in turn indirectly calls another imported function. Verify that the call graph and control flow are properly managed without stack corruption.

(assert_invalid
  (module
    (func $imported (import "env" "imported_func") (result i32))
    (func $exported (export "exported_func") (result i32)
      (call $imported) (drop) (i32.const 0)
    )
    (func $test
      (loop (result i32)
        (call $exported) (drop)
        (br_if 0 (i32.const 1))
      )
    )
    (start $test)
  )
  "type mismatch"
)