;; Test an indirect call to a function with nested loops where the inner loop condition involves an indirect function call itself. This will check for accurate handling of deeply nested loops in the CFG.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $func))
    (func $func (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $nested-loop (result i32)
      (local $i i32)
      (local.set $i (i32.const 0))
      (block $outer
        (loop $inner
          (call_indirect (type $sig) (local.get $i))
          (if (i32.eq (local.get $i) (i32.const 10))
            (then
              (br $outer)
            )
          )
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (br $inner)
        )
      )
      (local.get $i)
    )
  )
  "type mismatch"
)