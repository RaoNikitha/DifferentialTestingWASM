;; 7. Generate a test where a `block` contains a `call_indirect` leading to an `unreachable`. Examine if the block traps immediately or if it allows an improper return to the outer context.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result i32) (unreachable))
    (func $type-block-unreachable-via-call-indirect
      (block (call_indirect (type $t) (i32.const 0)))
    )
  )
  "type mismatch"
)