;; Introduce a `nop` instruction inside a nested block structure that contains multiple `call` and `call_indirect` instructions to verify that `nop` does not disrupt the nested function calls' order and correct execution.

(assert_invalid
  (module
    (func $nestedBlock (result i32)
      (block $outer
        (call $someFunction)
        (call_indirect (type $someType) (i32.const 0))
        (nop)
        (call $anotherFunction)
        (block $inner
          (call $yetAnotherFunction)
          (nop)
          (call_indirect (type $anotherType) (i32.const 1))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)