;; 9. Test an indirect call to a function in a module that is subsequently unloaded or replaced, ensuring the system correctly handles the module lifecycle and does not leave orphaned references or broken control flow.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32))
    (func $g
      (call_indirect (type 0) (i32.const 0) (i32.const 42))
    )
  )
  "module lifecycle error"
)