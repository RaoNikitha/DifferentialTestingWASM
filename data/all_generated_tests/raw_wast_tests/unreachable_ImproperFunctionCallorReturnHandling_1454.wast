;; 5. Place an `unreachable` instruction right before a `call_indirect` outside of any blocks. Ensure the trap prevents the indirect call, testing for type-checked function table lookups.

(assert_invalid
  (module
    (func $type-unreachable-before-call-indirect
      (unreachable)
      (call_indirect (type 0) (i32.const 0) (i32.const 0))
    )
    (type (func (param i32) (result i32)))
    (table (export "table") 1 funcref)
  )
  "type mismatch"
)