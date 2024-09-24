;; Ensure a predefined function is called indirectly without properly defining its type in the module context, verifying that missing type definitions lead to an `unreachable` execution path through the `call_indirect` instruction.

(assert_invalid
  (module
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "unknown type"
)