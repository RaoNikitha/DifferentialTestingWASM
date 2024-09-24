;; 4. Design a test where the `if` block contains early termination with a `br 0` instruction incorrectly causing stack misalignment. Tests how implementations handle invalid branch control.

(assert_invalid
  (module (func $if-branch-stack-misalignment
    (if (result i32) (i32.const 1) 
      (then (br 0)) 
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)