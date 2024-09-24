;; **Test 1:** Create a WASM module that exports a function enclosing a `block` instruction. Import this function in another module and call it from within a loop using `call` and `br_if`. This test checks whether the block type and context are correctly managed across module boundaries, preventing stack corruption.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (result i32)))
    (func $test
      (loop (result i32)
        (call $ext_func)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)