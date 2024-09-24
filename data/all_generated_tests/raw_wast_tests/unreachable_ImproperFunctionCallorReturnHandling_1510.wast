;; 1. Construct a WebAssembly module where a function is called with `call_indirect` that leads to an `unreachable` instruction. Evaluate if the trap from `unreachable` occurs immediately after the call or if the function improperly returns before trapping.

(assert_invalid
  (module
    (type $t (func))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (unreachable))
    (func (call_indirect (type $t) (i32.const 0)))
  )
  "type mismatch"
)