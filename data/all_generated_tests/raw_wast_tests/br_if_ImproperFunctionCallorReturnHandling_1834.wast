;; - A function that includes a `call_indirect` instruction within a `loop` following a `br_if` instruction. This test ensures that improper conditional branching and stack handling do not cause unintended indirect function calls, leading to execution errors.

(assert_invalid
  (module
    (func $conditional_call_indirect
      (block $outer
        (loop $inner
          (br_if 0 (i32.const 1))
          (call_indirect (type $functype) (i32.const 0) (i32.const 1))
        )
      )
    )
    (type $functype (func (param i32) (result i32)))
    (table 1 funcref)
  )
  "type mismatch"
)