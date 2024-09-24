;; 6. Develop a function that performs multiple `call_indirect` operations with different table indices, one of which points to a function with `unreachable`. Ensure the implementation correctly catches the trap only when the right indirect call occurs.

(assert_invalid
  (module
    (type $t (func))
    (table (export "table") 2 2 funcref)
    (elem (i32.const 0) $f $trapper)
    (func $f)
    (func $trapper (unreachable))
    (func $main
      (call_indirect (type $t) (i32.const 0))
      (call_indirect (type $t) (i32.const 1))
    )
  )
  "type mismatch"
)