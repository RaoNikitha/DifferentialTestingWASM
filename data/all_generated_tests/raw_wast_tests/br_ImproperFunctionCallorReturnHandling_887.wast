;; 8. Simulate errors in `call_indirect` table lookups causing control to jump to unintentional functions, followed by `br` instructions, testing if improper function calls are corrected back to the flow in wizard_engine but not in WebAssembly.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func
      (block
        (call_indirect (type $sig) (i32.const 1))
        (br 0)
      )
    )
    (type $sig (func))
  )
  "type mismatch"
)