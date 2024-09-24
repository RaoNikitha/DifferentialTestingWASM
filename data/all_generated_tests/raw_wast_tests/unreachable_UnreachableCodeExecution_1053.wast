;; 4. Test a `br_if` instruction that conditionally branches to a label but always ends with an `unreachable` instruction, ensuring that once reached, the trap occurs immediately.

(assert_invalid
  (module (func $type-br_if-unreachable 
    (block 
      (br_if 0 (i32.const 1)) 
      (unreachable)
    )
  ))
  "type mismatch"
)