;; 8. A `loop` that performs multiple `br_table` operations, targeting different depths of nested loops and modules. This checks for correct label indexing and handling when combined with cross-module imports and exports.

(assert_invalid
  (module 
    (func $nested-loop-br_table (export "nestedLoopBrTable") (param i32) (result i32)
      (local $depth i32)
      (local.set $depth (i32.const 0))
      (loop $outer (result i32)
        (loop $inner (result i32)
          (br_table $outer $inner (local.get $depth))
        )
      )
    )
  )
  "type mismatch"
)