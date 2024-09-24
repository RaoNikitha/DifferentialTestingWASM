;; 5. Validate a scenario where a `call_indirect` instruction in one module calls a function exported by another module, which then recursively calls back into the first module. Check that the stack unwinding and re-entering the calling module are correctly handled without corruption.

(assert_invalid
  (module
    (import "modB" "funcB" (func $funcB (type 0)))
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $funcB)
    (func $funcA (type 0) (param i32) (result i32)
      (call_indirect (type 0) (local.get 0))
    )
    (start $funcA)
  )
  "type mismatch"
)