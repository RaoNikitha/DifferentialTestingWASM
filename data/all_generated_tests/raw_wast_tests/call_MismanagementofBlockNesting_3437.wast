;; 6. **Test 6**: Generate a chain of nested blocks ending with a `call` instruction that introduces types not immediately consumed. The nested structure should sequentially exit, testing if deferred type operations from function calls are appropriately managed.

(assert_invalid
  (module
    (func $nested-blocks (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call 1 (i32.const 0))
            (block (result i32)
              (nop)
            )
          )
        )
      )
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)