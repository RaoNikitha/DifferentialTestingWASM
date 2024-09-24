;; 2. **Test Call Indirect with Mismatched Signature:**    - Implement a `block` that contains a `call_indirect` instruction with an incorrect type index pointing to an indirect table entry returning a different type than expected.    - **Constraint:** Verifies correct type lookup and error logging for indirect calls within blocks.

(assert_invalid
  (module
    (table 1 funcref)
    (type $sig0 (func (result i32)))
    (type $sig1 (func (result f32)))
    (func $type-call_indirect-mismatch
      (block (result i32)
        (call_indirect (type $sig1) (i32.const 0))
      )
    )
  )
  "type mismatch"
)