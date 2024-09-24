;; 7. Design a `br_table` inside a loop, with the loop index driving the `br_table` target index. Test how WebAssembly and wizard_engine differentiate in handling call stack manipulations within loops and ensure `checkAndPopArgs` correctly handles loop-based stack operations.

(assert_invalid
  (module
    (func $loop_with_br_table
      (local $index i32)
      (local $target i32)
      (loop $label
        (local.set $target (i32.add (local.get $index) (i32.const 1)))
        (br_table $label (local.get $target))
        (call 0)
        (local.set $index (i32.add (local.get $index) (i32.const 1)))
      )
    )
    (func (param i32))
  )
  "type mismatch"
)