;; 2. **Function Call within Nested Blocks:**    A function call is placed inside nested blocks followed by a `br` instruction targeting an outer block. Validate if the return address and operand stack are correctly managed, as improper handling might lead to an incorrect execution order.

(assert_invalid
  (module 
    (func $nested-blocks-call-br
      (block $outer
        (block $inner
          (call 0)
          (br 1)
        )
      )
    )
    (func (result i32) (i32.const 42))
  )
  "type mismatch"
)