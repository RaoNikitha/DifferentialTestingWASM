;; 10. Develop a test involving multiple nested `block` instructions within one module, with `nop` inserted between each `block`, and then `call` an imported function that includes its own control flow changes. This ensures `nop` does not interfere with the nesting and proper contextual transitions of control flow across module boundaries.

(assert_invalid
  (module 
    (import "env" "external_func" (func $external_func))
    (func (block (nop) (block (nop) (block (nop) (call $external_func)))))
  )
  "validation error"
)