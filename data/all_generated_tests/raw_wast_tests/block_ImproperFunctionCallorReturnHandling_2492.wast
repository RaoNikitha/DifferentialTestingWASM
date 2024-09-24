;; A `block` with a `call_indirect` instruction that uses a mismatched type index for the indirect call, ensuring proper exception handling and type validation. This tests the proper implementation of type checking mechanisms by the `block` instruction in different engines.

(assert_invalid
  (module (func $type-call_indirect-mismatch (result i32)
    (block (result i32)
      (call_indirect (type 1) (i32.const 0) (i64.const 10)) 
    )
  ))
  "type mismatch"
)