;; **Test 2: Unconditional Return Inside Nested Blocks**  Craft a function with multiple nested blocks and insert a return instruction deep within nested blocks. HALT the function execution before it normally would return, causing an inconsistency in the CFG. The goal is to check whether the CFG correctly handles jumping out of nested blocks to the function’s end. The Wizard Engine should correctly unwind nested blocks, while the WebAssembly implementation should properly manage block contexts.  _Checks CFG handling in nested block structures for unintentional early returns._

(assert_invalid
  (module
    (func $nested-return (result i32)
      (block (result i32)
        (block
          (block
            (return (i32.const 42))
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)