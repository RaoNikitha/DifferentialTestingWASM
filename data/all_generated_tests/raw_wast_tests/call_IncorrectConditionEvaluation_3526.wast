;; 5. **Test Description:** Use a `br_if` instruction to conditionally exit from a block before a `call` instruction. Verify whether `wizard_engine` correctly escapes the block leaving the stack unchanged, whereas `WebAssembly` condition evaluation may mistakenly execute the call. Specific Constraint:** Conditional branch exit before function invocation.

(assert_invalid
  (module
    (func $conditional-call
      (block $exit
        (br_if $exit (i32.const 1))
        (call 0)
      )
    )
    (func (param i32))
  )
  "conditional branch before call"
)