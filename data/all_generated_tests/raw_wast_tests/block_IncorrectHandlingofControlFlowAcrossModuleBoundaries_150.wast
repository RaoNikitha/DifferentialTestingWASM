;; 1. **Cross-Module Function Call with Nested Block**:    - Create two modules, one exporting a simple function that includes a nested `block` instruction and another importing and calling this function. The test checks if `wizard_engine` and WebAssembly correctly handle the nested context and label indexing when transitioning control flow across module boundaries.

(assert_invalid
  (module
    (import "env" "extFunc" (func $extFunc (result i32)))
    (func $caller
      (block (result i32)
        (call $extFunc)
        (block (result i32)
          (i32.const 42)
          (br 0)
          (i32.const 1)
          (i32.add)
        )
      )
    )
  )
  "type mismatch"
)