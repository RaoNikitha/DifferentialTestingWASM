;; Construct a `block` within which there's an indirect function call (`call_indirect`) that branches to an outer block label. This will assess if the function return values are correctly propagated through the blocks to ensure proper call and return semantics aren't violated.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (func $type-indirect-call-break (result i32)
      (block (result i32)
        (call_indirect (type $t0) (i32.const 0) (block (result i32) (br 1 (i32.const 42))))
      )
    )
    (table funcref (elem $type-indirect-call-break))
  )
  "type mismatch"
)