;; 8. **Test Description:** Test a function that includes a `call` instruction with a conditional return based on the global state. Ensure proper global state evaluation interacts differently under `wizard_engine`, which checks the argument stack thoroughly compared to `WebAssembly`. Specific Constraint:** Global state influencing function invocation.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (type (func (param i32) (result i32)))
    (func $conditional-call (param i32) (result i32)
      (global.get $g)
      (if (result i32)
        (i32.eqz (local.get 0))
        (then (i32.const 42))
        (else (call $callee (i32.const 1)))
      )
    )
    (func $callee (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)