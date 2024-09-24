;; 6. **Complex Arithmetic Conditions**: Create a test using complex arithmetic operations to set up the condition. Ensure that the arithmetic result correctly influences the `if` instruction and subsequent branching. Confirm if one implementation misinterprets the arithmetic condition leading to incorrect branch decisions.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
          (i32.add (i32.const 1) (i32.const 2))  ;; Complex arithmetic condition
          (then (i32.const 42))
          (else (i32.const 84))
      )
    )
  )
  "type mismatch"
)