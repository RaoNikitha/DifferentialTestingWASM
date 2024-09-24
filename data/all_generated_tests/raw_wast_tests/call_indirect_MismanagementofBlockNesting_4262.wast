;; 1. Create a WebAssembly module with nested blocks, such that an inner block's `call_indirect` instruction references a table that points to a function with matching type signatures. Validate that the module handles the depth of the nested blocks correctly when invoking `call_indirect`. This checks for proper nesting management against `CALL_INDIRECT` implementation.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func
      (block
        (loop
          (call_indirect (type $sig) (i32.const 0) (i32.const 42))
        )
      )
    )
  )
  "type mismatch"
)