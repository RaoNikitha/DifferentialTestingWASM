;; <Test 3> Develop a WebAssembly module that includes a `block` enclosing another `block` and `loop`. Inside the innermost block, place a `call_indirect` instruction with type comparison. Follow this by a `br` instruction to the outer block label. Ensure that the target function type matches and that the branching does not disrupt the function call sequence.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (call_indirect (type 0) (local.get 0) (i32.const 1))
            (br 1)
          )
          (i32.const 2)
        )
      )
    )
    (type (func (param i32) (result i32)))
  )
  "type mismatch"
)