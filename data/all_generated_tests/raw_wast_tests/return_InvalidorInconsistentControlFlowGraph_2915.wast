;; **Test 4: Return with Intentionally Corrupted Type Stack**  Design a function to push correctly followed by incorrectly typed values before issuing a return call, causing type expectations mismatch. This targets the Wizard Engine’s popE type validation versus WebAssembly’s inherent pattern-based type requirement. Ensure the stack is left in an inconsistent type state right before return, focusing on CFG errors from incorrect type assumptions.  _Checks CFG for consistent type state validations during function return._

(assert_invalid
  (module
    (func $type-corruption-before-return (result i32)
      (i32.const 10)
      (f32.const 1.5)
      (return)
      (i32.const 0)
    )
  )
  "type mismatch"
)