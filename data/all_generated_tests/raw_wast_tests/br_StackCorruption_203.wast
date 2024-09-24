;; 4. Test Description: Implement a function with nested `if` constructs containing a `br` instruction to an outer block, placing multiple operand types on the stack. Check how WebAssembly versus `wizard_engine` handle stack unwinding for diverse operand populations.

(assert_invalid
  (module
    (func $nested-if-with-br
      (i32.const 1)
      (i32.const 2)
      (if (result i32)
        (br 1)
      )
      (drop)
    )
  )
  "type mismatch due to br unwinding"
)