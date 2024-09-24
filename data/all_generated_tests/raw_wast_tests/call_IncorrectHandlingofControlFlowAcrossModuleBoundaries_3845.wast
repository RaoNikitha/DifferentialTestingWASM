;; 4. Implement a call chain where a locally defined function calls an imported function, which in turn calls another function from the original module. Ensure that the transition between modules is handled correctly, with all function indices validated and no control flow errors or stack issues arising.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported (param i32) (result i32)))
    (func $local_func
      (i32.const 42)
      call $imported
    )
    (func $reused_func (param i32)
      (i32.const 24)
      call 0
    )
  )
  "type mismatch"
)