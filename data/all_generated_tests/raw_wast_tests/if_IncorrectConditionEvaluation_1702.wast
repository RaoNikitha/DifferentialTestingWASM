;; 3. Test an `if` instruction with a nested conditional branch where the outer condition is false, but the `Wizard Engine` mistakenly evaluates it as true, leading to execution of the inner block.

(assert_invalid
  (module
    (func $nested-if-condition (result i32)
      (i32.const 0)
      (if (result i32)
        (then 
          (i32.const 1)
          (if (result i32) (i32.const 1) (then (i32.const 2)) (else (i32.const 3)))
        )
        (else 
          (i32.const 4)
        )
      )
    )
  )
  "type mismatch"
)