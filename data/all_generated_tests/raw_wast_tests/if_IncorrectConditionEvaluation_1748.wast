;; 9. Use nested `if-else` blocks where `br_if` instructions in `else` blocks evaluate conditions. Ensure the `br_if` statements do not branch if the conditions are false. This tests correct branching in else statements' specific paths.

(assert_invalid
  (module (func $nested-if-else-br_if
    (result i32)
    (if (result i32) (i32.const 1)
      (then
        (if (result i32) (i32.const 0)
          (then (i32.const 42))
          (else (br_if 0 (i32.const 1)))))
      (else (br_if 0 (i32.const 0)))) 
    (i32.const 99)))
  "type mismatch"
)