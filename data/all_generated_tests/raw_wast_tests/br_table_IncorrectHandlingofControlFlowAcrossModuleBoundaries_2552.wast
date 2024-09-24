;; **Test 1: Cross-module call with br_table to mismatching label arity** - Module A exports a function that includes a `br_table` instruction where the labels have mismatching operand types. - Module B imports this function from Module A and adds it to its control flow. - Test checks whether `wizard_engine` correctly identifies `BrTableArityMismatch` and aborts properly, while WebAssembly continues execution without error.

(assert_invalid
  (module
    (import "moduleA" "exportedFunction" (func $importedFunc (param i32)))
    (func (param i32)
      (block (result f32)
        (br_table 0 0 (local.get 0))
      )
      (call $importedFunc (local.get 0))
    )
  )
  "type mismatch"
)