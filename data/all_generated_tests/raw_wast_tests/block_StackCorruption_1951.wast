;; 2. **Mismatched Block Type**: Define a block with a type indicating it should produce a value, but include instructions that either don't push any value or push an incorrect type. Check if this leads to stack corruption upon block exit.

(assert_invalid
  (module (func $mismatched-block-type (result i32)
    (block (result i32) (nop) (i32.const 42))
  ))
  "type mismatch"
)