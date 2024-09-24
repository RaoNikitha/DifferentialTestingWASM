;; 10. **Type Mismatch in Nested Control Instructions:**     - Create nested control instructions (e.g., `block` within `loop`) that incorporate `call_indirect` with mismatched function types. Ensure that both OCaml and Java implementations enforce type constraints and correctly trap on discovering type mismatches within nested control flows.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $nested-control
      (block (loop
        (call_indirect (type 0) (i32.const 0) (i32.const 42))
      ))
    )
  )
  "type mismatch"
)