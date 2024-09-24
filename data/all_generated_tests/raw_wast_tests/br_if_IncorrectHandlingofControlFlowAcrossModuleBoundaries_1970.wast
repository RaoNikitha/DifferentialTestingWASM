;; 1. **Test 1: Importing Function and Conditional Branch to Outer Block**    - **Description**: Create a WASM module that imports a function, then within an inner block, execute a `br_if` instruction to conditionally branch to the outer block. Test to ensure the conditional branch is correctly handled across module boundaries, verifying the operand stack coherence in both implementations.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (block $outer (result i32)
        (block $inner (result i32)
          (i32.const 0)
          (call $external_func)
          (br_if 1 (i32.const 1))
          (i32.const 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)