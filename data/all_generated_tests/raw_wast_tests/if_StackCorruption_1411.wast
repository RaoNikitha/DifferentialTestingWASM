;; 2. Nested Conditional with Unmatched Labels: Test nested `if` instructions with mismatched labels to see if the inner `else` disrupts stack integrity. ```wasm // Example (if (result i32)   (then      (if (result i32)       (then i32.const 20)       (else)     )   )   (else) ) ``` *Reasoning*: This test checks if nested branches improperly manage the stack when labels are improperly matched, causing stack corruption.

(assert_invalid
  (module (func $nested-conditional-unmatched-labels (result i32)
    (if (result i32)
      (then
        (if (result i32)
          (then i32.const 20)
          (else)
        )
      )
      (else)
    )
  ))
  "type mismatch"
)