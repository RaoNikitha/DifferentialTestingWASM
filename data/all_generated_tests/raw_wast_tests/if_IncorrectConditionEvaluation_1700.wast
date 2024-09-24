;; 1. Test where the `if` instruction condition is evaluated as zero (false), but in the `Wizard Engine`, it incorrectly enters the `then` block due to faulty stack management.

(assert_invalid
  (module
    (func
      (if (result i32) (i32.const 0) (then (i32.const 42)) (else (i32.const 0)))
      (drop)
    )
  )
  "type mismatch"
)