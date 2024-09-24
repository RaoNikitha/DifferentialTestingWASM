;; 8. **Test Description**: Define a complex control flow with multiple `br` instructions and a `call_indirect` instruction after several branches. Alter the type index dynamically and ensure the branch target correctly triggers a trap when there's a mismatch in function types.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $f1 (param i32) (result i32) (i32.const 0))
    (table 1 funcref)
    (elem (i32.const 0) $f1)
    (func $complex_control_flow
      (block
        (br 0)
        (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
      )
      (call_indirect (type $sig2) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)